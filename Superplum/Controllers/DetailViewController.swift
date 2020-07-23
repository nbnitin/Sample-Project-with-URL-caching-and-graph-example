//
//  DetailViewController.swift
//  Superplum
//
//  Created by Nitin on 23/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,FoodSafetyDelegate {
    
    //variables
    var model : SuperplumModel!
    var pdfAssetID : Int!
    var cells : [CELLTYPE]!
    
    //outlets
    @IBOutlet weak var tblDetail: UITableView!
    @IBOutlet weak var topView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = NetworkManager.shared.model
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(logOut), name: .TimeOutUserInteraction, object: nil)
    }
    
    @objc func logOut(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //Mark:- table view delegates and data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch cells[indexPath.row] {
        case .NameAndPlace:
            return getOwnerNameCell(indexPath: indexPath, tableView: tableView)
        case .ProductNameAndImage:
            return getProductNameAndImageCell(indexPath: indexPath, tableView: tableView)
        case .FoodSafety:
            return getFoodSafetyCell(indexPath: indexPath, tableView: tableView)
        case .Harvest:
            return getHarvestCell(indexPath: indexPath, tableView: tableView)
        case .Graph:
            return getGraphCell(indexPath: indexPath, tableView: tableView)
        case .Farmer:
            return getFarmerCell(indexPath: indexPath, tableView: tableView)
        case .FlagCell:
            return getFlagCell(indexPath: indexPath, tableView: tableView)
        default:
            break
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "lastCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if cells[indexPath.row] == .Harvest {
            var count = 0
            if let batch = NetworkManager.shared.model.Batch {
                if let productVariant = NetworkManager.shared.model.ProductVariant {
                    
                    if let _ = batch.Diameter {
                        count += 1
                    }
                    if let _ = batch.AvgWeight {
                        count += 1
                    }
                    if let _ = productVariant.ColorName {
                        count += 1
                    }
                    if let _ = batch.TSS {
                        count += 1
                    }
                    if let _ = batch.Acidity {
                        count += 1
                    }
                    if let _ = batch.TSS,let _ = batch.Acidity {
                        count += 1
                    }
                    return CGFloat(34 * count + 100 + 30) //10 = gap from bottom, 100 = label total size of headings
                }
            }
        }
        return UITableView.automaticDimension
    }
    
    //Mark:- get owner cell
    func getOwnerNameCell(indexPath:IndexPath,tableView:UITableView)->OwnerNamePlaceCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ownerNamePlace", for: indexPath) as! OwnerNamePlaceCell
        cell.backgroundColor = NetworkManager.shared.secondaryColor
        cell.setupData()
        return cell
    }
    
    //Mark:- get product image  cell
    func getProductNameAndImageCell(indexPath:IndexPath,tableView:UITableView)->ProductNameAndImage {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productNameAndImage", for: indexPath) as! ProductNameAndImage
        cell.setupData()
        cell.backgroundColor = NetworkManager.shared.primaryColor
        return cell
    }
    
    //Mark:- get food safety cell
    func getFoodSafetyCell(indexPath:IndexPath,tableView:UITableView)->FoodSafetyCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodSafety", for: indexPath) as! FoodSafetyCell
        cell.delegate = self
        cell.backgroundColor = .white
        cell.setupData()
        return cell
    }
    
    //Mark:- get harvestCell
    func getHarvestCell(indexPath:IndexPath,tableView:UITableView)->HarvestCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "harvestCell", for: indexPath) as! HarvestCell
        // cell.makeLine()
        cell.setupData()
        cell.backgroundColor = NetworkManager.shared.primaryColor
        return cell
    }
    
    //Mark:- get graph cell
    func getGraphCell(indexPath:IndexPath,tableView:UITableView)->GraphCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! GraphCell
        cell.setupData()
        cell.backgroundColor = NetworkManager.shared.secondaryColor
        return cell
    }
    
    //Mark:- get farmer cell
    func getFarmerCell(indexPath:IndexPath,tableView:UITableView)->FarmerCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "farmerCell", for: indexPath) as! FarmerCell
        cell.setupData()
        cell.backgroundColor = NetworkManager.shared.secondaryColor
        return cell
    }
    
    //Mark:- get flag cell
    func getFlagCell(indexPath:IndexPath,tableView:UITableView)->FlagCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flagCell", for: indexPath) as! FlagCell
        cell.setupData()
        return cell
    }
    
    
    //Mark:- food safety delegate
    func didTapButton(_ assestID: Int) {
        self.pdfAssetID = assestID
        performSegue(withIdentifier: "loadPDF", sender: self)
    }
    
    func didTapMessage(_ score: Int) {
        self.view.showMessageView(score: score)
    }
    
    //Mark:- preparing for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "loadPDF" ){
            let vc = segue.destination as! PDFViewController
            vc.assetID = self.pdfAssetID
        } 
    }
    
    //Mark:- scan now action
    @IBAction func scanNow(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //Mark:- takes screenshot and share image
    @IBAction func takeScreenShot(_ sender: Any) {
        excludeViews()
        guard let img = takeScreenShot() else {
            reIncludeViews()
            return
        }
        reIncludeViews()
        shareImage(image: img)
    }
    
    //Mark:- exclude view
    func excludeViews(){
        self.view.showLoad()
        for subView in topView.subviews {
            if let btn = subView as? UIButton {
                btn.isHidden = true
            }
        }
    }
    
    func reIncludeViews(){
        self.view.hideLoad()
        for subView in topView.subviews {
            if let btn = subView as? UIButton {
                btn.isHidden = false
            }
        }
    }
    
    
    //Mark:- take screenshot
    private func takeScreenShot()->UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: tblDetail.contentSize.width, height: tblDetail.contentSize.height + 100), _: false, _: 0.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        let previousFrame = view.frame
        view.frame = CGRect(x: 0, y: 0, width: tblDetail.contentSize.width, height: tblDetail.contentSize.height + 100)
        
        if let context = context {
            view.layer.render(in: context)
        }
        view.frame = previousFrame
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
        
        //performSegue(withIdentifier: "showImage", sender: self)
        
    }
    
    private func shareImage(image:UIImage){
        var imagesToShare = [AnyObject]()
        imagesToShare.append(image)
        let activityViewController = UIActivityViewController(activityItems: imagesToShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        present(activityViewController, animated: true, completion: nil)
    }
    
}
