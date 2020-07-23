//
//  FarmerCell.swift
//  Superplum
//
//  Created by Nitin on 27/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit

class FarmerCell: UITableViewCell {

    @IBOutlet weak var imgFarmer: UIImageView!
    @IBOutlet weak var lblFarmerName: CustomLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(){
        imgFarmer.loadImage(url: NetworkManager.shared.baseURL + NetworkManager.shared.assetsURL + "FileAssetID=\(NetworkManager.shared.model.Farmlot.FarmLotAssetImage?.FileAssetID ?? 0)&FileViewType=0")
        lblFarmerName.text = ("FARMER: " + (NetworkManager.shared.model.Farmlot?.Name ?? "")).uppercased()
    }

}
