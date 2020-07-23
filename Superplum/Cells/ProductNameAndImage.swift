//
//  ProductNameAndImage.swift
//  Superplum
//
//  Created by Nitin on 23/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit

class ProductNameAndImage: UITableViewCell {

    @IBOutlet weak var lblProductName: CustomLabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var imgStamp: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupData(){
        imgProduct.loadImage(url: NetworkManager.shared.baseURL + NetworkManager.shared.assetsURL + "FileAssetID=\(NetworkManager.shared.model.Product.AssetID?.FileAssetID ?? 0)&FileViewType=0")
        lblProductName.text = NetworkManager.shared.model.Product.AppProductTagLine
        
        guard let sampleQC = NetworkManager.shared.model.SampleQC else {
            imgStamp.isHidden = true
            return
        }
        
        if ( sampleQC.OrganicType == 1 ) {
            if ( sampleQC.OrganicTypeID == 1 ) {
                //ogranic grown
                imgStamp.image = UIImage(named: "Orginacally")
            } else if ( sampleQC.OrganicTypeID == 2 ) {
                //organically grown
                imgStamp.image = UIImage(named: "Orginacally")
            }
        } else if ( sampleQC.ProductScore != 1 ){
            imgStamp.image = UIImage(named:"SafeToEat")
        } else {
            imgStamp.isHidden = true
        }
        
        
    }
}
