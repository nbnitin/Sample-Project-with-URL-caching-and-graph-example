//
//  PDFViewController.swift
//  Superplum
//
//  Created by Nitin on 24/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//
//"http://www.africau.edu/images/default/sample.pdf"

import UIKit
import PDFKit

class PDFViewController: UIViewController {
    
    @IBOutlet weak var pdfViewContainer: UIView!
    
    var pdfView : PDFView!
    var assetID : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfView = PDFView(frame: CGRect(x:0,y:0,width: pdfViewContainer.frame.width,height: pdfViewContainer.frame.height - 100))
        pdfViewContainer.addSubview(pdfView)
        self.view.showLoad()
       
        let urlString = NetworkManager.shared.baseURL+NetworkManager.shared.assetsURL+"FileAssetID="+"\(assetID!)"
        NetworkManager.shared.downloadContentGet(fromUrlString:urlString, contentType: .pdf , completionHandler: {(result) in
            
            DispatchQueue.main.async {
                self.view.hideLoad()
            }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.pdfView.document = PDFDocument(data: data)
                    //allowing for zoom
                    self.pdfView.autoScales = true
                    self.pdfView.maxScaleFactor = 4
                    self.pdfView.minScaleFactor = self.pdfView.scaleFactorForSizeToFit
                    self.pdfView.usePageViewController(false, withViewOptions: nil)
                    
                }
                break
            case .failure(let err):
                break
            }
        })
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(logOut), name: .TimeOutUserInteraction, object: nil)
    }
    
    @objc func logOut(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
