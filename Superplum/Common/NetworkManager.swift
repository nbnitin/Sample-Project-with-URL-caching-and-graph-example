//
//  NetworkManager.swift
//  Superplum
//
//  Created by Nitin on 23/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

//Note: post request cannot be cached only get request can, cached depends on unique url. sot that why we are making here unique url with appending bach id

enum CONTENT_TYPE:String {
    case pdf = "application/pdf"
    case image = "application/image"
}

import Foundation
import Network
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    var model : SuperplumModel!
    var primaryColor : UIColor!
    var secondaryColor : UIColor!
    var batchId = ""
    var lat : Double = 0
    var lng : Double = 0
    
    var baseURL : String = "https://sppublicapi-dev.azurewebsites.net" //http://publicapi.freshmanager.in //https://sppublicapi-dev.azurewebsites.net
    var assetsURL : String  = "/BatchInfo/FileAssets_Get?"
    var detailURL : String = "/BatchInfo/SampleQC_FromBatch"
    
    
    
    private let allowedDiskSize = 100 * 1024 * 1024
    private lazy var cache: URLCache = {
        return URLCache(memoryCapacity:0, diskCapacity: allowedDiskSize, diskPath: "gifCache")
    }()
    
    typealias DownloadCompletionHandler = (Result<Data,Error>) -> ()
    
    
    init(){
        //create initial userdefault
        guard let _ = UserDefaults.standard.value(forKey: "CustomUrls") as? [[String:Date]] else {
            let x = [[String:Date]]()
            UserDefaults.standard.set(x, forKey: "CustomUrls")
            return
        }
    }
    //
    
    //Mark:- create url session
    private func createAndRetrieveURLSession() -> URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.requestCachePolicy = .reloadIgnoringCacheData
        sessionConfiguration.urlCache = cache
        return URLSession(configuration: sessionConfiguration)
    }
    
    //Mark:- handle post requets
    public func downloadContent(fromUrlString: String, completionHandler: @escaping DownloadCompletionHandler) {
        
        guard let downloadUrl = URL(string: fromUrlString) else { return }
        var urlRequest = URLRequest(url: downloadUrl)
        
        let cachedUrl = URLRequest(url:URL(string:fromUrlString + batchId)!)
        
        urlRequest.addValue("DB7B3774-983B-4F0F-8589-CABCDB818B79", forHTTPHeaderField: "APIKEY")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = "POST"
        
        let parameters: [String: Any] = [
            "batchCode" : batchId,
            "lat" : "0",
            "lng" : "0"
        ]
        
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        // First try to fetching cached data if exist
        if let cachedData = self.cache.cachedResponse(for: cachedUrl) {
            print("Cached data in bytes:", cachedData.data)
            completionHandler(.success(cachedData.data))
        } else {
            // No cached data, download content than cache the data
            createAndRetrieveURLSession().dataTask(with: urlRequest) { (data, response, error) in
                
                if let error = error {
                    completionHandler(.failure(error))
                } else {
                    do {
                        //create json object from data
                        if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                            print(json)
                            if let err = json["HasError"] as? Int {
                                if ( err == 0 ) {
                                    self.storeCachedResponse(data: data!,url:cachedUrl,response:response!)
                                    completionHandler(.success(data!))
                                } else {
                                    let errorsObj = json["Errors"] as! NSArray
                                    let errors = errorsObj.firstObject as! [String:Any]
                                    let err = NSError(domain: "", code: errors["ErrorCode"] as! Int, userInfo: ["message":errors["ErrorMessage"] as! String])
                                    completionHandler(.failure(err))
                                }
                            }
                        }
                    } catch let error {
                        print(error.localizedDescription)
                    }
                    
                }
            }.resume()
        }
    }
    
    
    //Mark:- handle get requets
    public func downloadContentGet(fromUrlString: String,contentType:CONTENT_TYPE, completionHandler: @escaping DownloadCompletionHandler) {
        
        guard let downloadUrl = URL(string: fromUrlString) else { return }
        var urlRequest = URLRequest(url: downloadUrl)
        
        let cachedUrl = URLRequest(url:URL(string:fromUrlString + batchId)!)
        
        urlRequest.addValue("DB7B3774-983B-4F0F-8589-CABCDB818B79", forHTTPHeaderField: "APIKEY")
        urlRequest.addValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")

        
        urlRequest.httpMethod = "GET"
        
        if let cachedData = self.cache.cachedResponse(for: cachedUrl) {
            print("Cached data in bytes:", cachedData.data)
            completionHandler(.success(cachedData.data))
            
        } else {
            // No cached data, download content than cache the data
            createAndRetrieveURLSession().dataTask(with: urlRequest) { (data, response, error) in
                
                if let error = error {
                    completionHandler(.failure(error))
                } else {
                    self.storeCachedResponse(data: data!,url:cachedUrl,response:response!)
                    completionHandler(.success(data!))
                }
            }.resume()
        }
    }
    
    //Mark:- store cached response, and records for url status and date into user default
    private func storeCachedResponse(data:Data, url:URLRequest, response: URLResponse) {
        let cachedData = CachedURLResponse(response: response, data: data)
        self.cache.storeCachedResponse(cachedData, for: url)
        
        var x = UserDefaults.standard.value(forKey: "CustomUrls") as! [[String:Date]]
        let newData = [url.url!.absoluteString:Date()]
        x.append(newData)
        UserDefaults.standard.set(x, forKey: "CustomUrls")
        
    }
    
    //Mark:- remove all cached response older than 7 days
    public func removeAllCachedResponse(){
        guard let datas = UserDefaults.standard.value(forKey: "CustomUrls") as? [[String:Date]] else {
            return
        }
        
        let calendar: NSCalendar = NSCalendar.current as NSCalendar
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: Date())
        let flags = NSCalendar.Unit.day
        
        for item in datas {
            let key = item.first?.key
            let value = item[item.first!.key]
            
            if let date2 = value as? Date {
                let dateNew = calendar.startOfDay(for: date2)
                let components = calendar.components(flags, from: date1, to: dateNew, options: .init())
                
                if ( components.day! >= 7  ) {
                    let urlRequest = URLRequest(url: URL(string:key!)!)
                    cache.removeCachedResponse(for: urlRequest)
                }
            }
        }
    }
    
}
