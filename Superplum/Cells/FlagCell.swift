//
//  FlagCell.swift
//  Superplum
//
//  Created by Nitin on 27/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit

class FlagCell: UITableViewCell {
    
    @IBOutlet var lblSecondary: [CustomLabel]!
    
    @IBOutlet var imgSecondary: [UIImageView]!
    
    @IBOutlet var lblPrimary: [CustomLabel]!
    
    @IBOutlet var viewSeperatorPrimary: [UIView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.frame.size.height = 500
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(){
        let secondary = NetworkManager.shared.secondaryColor
        let primary = NetworkManager.shared.primaryColor
        
        for lbl in lblSecondary {
            lbl.textColor = secondary
        }
        
        for img in imgSecondary {
            img.tintColor = secondary
        }
        
        for lbl in lblPrimary {
            lbl.textColor = primary
        }
        
        for v in viewSeperatorPrimary {
            
            v.drawDottedLine(start: CGPoint(x: v.bounds.minX, y: v.frame.height), end: CGPoint(x: v.bounds.maxX, y: v.frame.height), view: v, color: primary!.cgColor)
        }
    }

}
