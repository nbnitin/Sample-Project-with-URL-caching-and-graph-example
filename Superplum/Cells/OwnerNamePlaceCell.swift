//
//  OwnerNamePlaceCell.swift
//  Superplum
//
//  Created by Nitin on 23/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit

class OwnerNamePlaceCell: UITableViewCell {
    
    @IBOutlet weak var lblName: CustomLabel!
    @IBOutlet weak var lblPlace: CustomLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(){
        lblName.text = (NetworkManager.shared.model.ProductVariant?.Name ?? "").uppercased()
        lblPlace.text = "FROM : " + (NetworkManager.shared.model.Farmlot.StateName ?? NetworkManager.shared.model.Company?.StateName ?? "").uppercased()
    }

}
