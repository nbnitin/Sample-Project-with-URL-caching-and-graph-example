//
//  ViewController.swift
//  Superplum
//
//  Created by Nitin on 23/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit
import CoreLocation
import Foundation

enum CELLTYPE {
    case NameAndPlace
    case ProductNameAndImage
    case FoodSafety
    case Harvest
    case Graph
    case Farmer
    case FlagCell
    case LastCell
}

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    //variables
    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager.shared.batchId = "53000009-02-2020"
        NetworkManager.shared.lat = 0
        NetworkManager.shared.lng = 0
        
        //        if (CLLocationManager.locationServicesEnabled()) {
        //            locationManager = CLLocationManager()
        //            locationManager.delegate = self
        //            locationManager.requestAlwaysAuthorization()
        //            locationManager.requestWhenInUseAuthorization()
        //            locationManager.startUpdatingLocation()
        //        } else {
        //            setUpData()
        //        }
        
        setUpData()
        //below code is used to print all available fonts with their names, remove comment to check font names, useful to check either custom font is attached or not
        
        /*let familyName = UIFont.familyNames.sorted()
         for family: String in familyName
         {
         print(family)
         for names: String in UIFont.fontNames(forFamilyName: family)
         {
         print("== \(names)")
         }
         }*/
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return
        }
        
        NetworkManager.shared.lat = Double(locValue.latitude)
        NetworkManager.shared.lng = Double(locValue.longitude)
        setUpData()
    }
    
    
    
    public func setUpData(){
        
        //removing cache older than 7 days
        //calls for removeAllCachedResponse
        NetworkManager.shared.removeAllCachedResponse()
        self.view.showLoad()
        NetworkManager.shared.downloadContent(fromUrlString:NetworkManager.shared.baseURL+NetworkManager.shared.detailURL, completionHandler: { (result) in
            
            DispatchQueue.main.async {
                self.view.hideLoad()
            }
            
            switch result {
            case .success(let yourData):
                
                
                // handle data
                do {
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: yourData, options: .mutableContainers) as? [String: Any] {
                        print(json["Result"])
                        let dataFinal = json["Result"] as! [String:AnyObject]
                        let jsonData = try? JSONSerialization.data(withJSONObject: dataFinal, options: [])
                        do {
                            
                            let model = try JSONDecoder().decode(SuperplumModel.self,from: jsonData!)
                            NetworkManager.shared.model = model
                            
                            var primaryColor : String?
                            var secondaryColor : String?
                            
                            if let priColor = model.Product.PrimaryAppColor {
                                primaryColor = priColor
                                NetworkManager.shared.primaryColor = UIColor(hexString: priColor)
                            }
                            
                            if let secColor = model.Product.SecondaryAppColor {
                                secondaryColor = secColor
                                NetworkManager.shared.secondaryColor = UIColor(hexString: secColor)
                            }
                            
                            if ( (primaryColor == nil || primaryColor == "") && (secondaryColor == nil || secondaryColor == "") ) {
                                //invalid batch code
                            } else {
                                // go to detail controller...
                                DispatchQueue.main.async {
                                   self.performSegue(withIdentifier: "detailView", sender: self)
                                }
                            }
                            
                        } catch let error {
                            print((error as? DecodingError).debugDescription)
                        }
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
                break
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(str: error.localizedDescription)
                }
                debugPrint(error.localizedDescription)
            }
            
            
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //deciding which cell require to show
        if ( segue.identifier == "detailView" ) {
            
            var cells = [CELLTYPE]()
            let model = NetworkManager.shared.model
            
            if let _ = model?.ProductVariant, let _ = model?.Farmlot, let _ = model?.Company {
                cells.append(.NameAndPlace)
            }
            
            if let _ = model?.Product {
                cells.append(.ProductNameAndImage)
            }
            
            if let _ = model?.SampleQC {
                cells.append(.FoodSafety)
            }
            
            if let readings = model?.Readings {
                if ( readings.TemperatureReadings!.count > 1 || readings.HumidityReadings!.count > 1 ) {
                    cells.append(.Graph)
                }
            }
            
            if let _ = model?.ProductVariant, let _ = model?.Batch {
                cells.append(.Harvest)
            }
            
            if let _ = model?.Farmlot {
                cells.append(.Farmer)
            }
            
            cells.append(.FlagCell)
            cells.append(.LastCell)
            
            let vc = segue.destination as! DetailViewController
            vc.cells = cells
        }
    }
}

