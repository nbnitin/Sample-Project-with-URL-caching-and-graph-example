//
//  FoodSafetyCell.swift
//  Superplum
//
//  Created by Nitin on 24/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit



protocol FoodSafetyDelegate: class {
    func didTapButton(_ assestID: Int)
    func didTapMessage(_ score:Int)
}

let MIN_COMPARISION_VALUE = 1

class FoodSafetyCell: UITableViewCell {
    
    //variables
    var count = 0
    var isProduct = false
    var isSoil = false
    var isWater = false
    var sampleQC : SampleQC!
    var prodScore = 0
    var soilScore = 0
    var waterScore = 0
    
    var leftScore = 0
    var centerScore = 0
    var rightScore = 0
    
    @IBOutlet weak var lblFoodSafetyHeading: CustomLabel!
    
    @IBOutlet weak var lblHowSafeHeading: CustomLabel!
    
    @IBOutlet weak var lblDownloadHeading: CustomLabel!
    @IBOutlet weak var viewLeft: UIView!
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var viewRight: UIView!
    
    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var lblLeft: CustomLabel!
    @IBOutlet weak var btnLeft: UIButton!
    
    @IBOutlet weak var imgTickLeft: UIImageView!
    
    @IBOutlet weak var imgCenter: UIImageView!
    @IBOutlet weak var lblCenter: CustomLabel!
    @IBOutlet weak var btnCenter: UIButton!
    @IBOutlet weak var imgTickCenter: UIImageView!
    
    @IBOutlet weak var imgRight: UIImageView!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var lblRight: CustomLabel!
    @IBOutlet weak var imgTickRight: UIImageView!
    
    var delegate : FoodSafetyDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func doMessageActionForLeftView(){
        delegate.didTapMessage(leftScore)
    }
    
    @objc func doMessageActionForCenterView(){
        delegate.didTapMessage(centerScore)
    }
    
    @objc func doMessageActionForRightView(){
        delegate.didTapMessage(rightScore)
    }
    
    func setupData(){
             
        viewLeft.isHidden = true
        viewRight.isHidden = true
        viewCenter.isHidden = true
        
        let leftGesture = UITapGestureRecognizer(target: self, action: #selector(doMessageActionForLeftView))
        let centerGesture = UITapGestureRecognizer(target: self, action: #selector(doMessageActionForCenterView))
        let rightGesture = UITapGestureRecognizer(target: self, action: #selector(doMessageActionForRightView))
        
        guard let sampleQC = NetworkManager.shared.model.SampleQC else {
            return
        }
        
        let color = NetworkManager.shared.secondaryColor
        
        lblHowSafeHeading.textColor = color
        lblDownloadHeading.textColor = color
        lblFoodSafetyHeading.textColor = color
        
        imgLeft.tintColor = color
        imgCenter.tintColor = color
        imgRight.tintColor = color
        
        
        lblLeft.textColor = color
        lblCenter.textColor = color
        lblRight.textColor = color
        
        btnLeft.tintColor = color
        btnCenter.tintColor = color
        btnRight.tintColor = color

        
        self.sampleQC = sampleQC
        
        if let prodScore = sampleQC.ProductScore, prodScore > 0 {
            count = 1
            isProduct = true
            self.prodScore = prodScore
        }
        
        if let soilScore = sampleQC.SoilScore, soilScore > 0 {
            count += 1
            isSoil = true
            self.soilScore = soilScore
        }
        
        if let waterScore = sampleQC.WaterScore, waterScore > 0 {
            count += 1
            isWater = true
            self.waterScore = waterScore
        }
        
        if ( count == 1  ) {
            viewCenter.isHidden = false
            viewCenter.isUserInteractionEnabled = true
            viewCenter.addGestureRecognizer(centerGesture)
            
            if ( isProduct ) {
                imgCenter.image = UIImage(named: "Product")
                lblCenter.text = "PRODUCT"
                centerScore = prodScore
                
                if ( prodScore == MIN_COMPARISION_VALUE ) {
                    imgTickCenter.image = UIImage(named:"Cross")
                    imgTickCenter.tintColor = .red
                } else {
                    imgTickCenter.image = UIImage(named: "Tick")
                    imgTickCenter.tintColor = UIColor(hexString: "46B447")
                }
                
            } else if ( isSoil ) {
                imgCenter.image = UIImage(named: "Soil")
                lblCenter.text = "SOIL"
                centerScore = soilScore

                if ( soilScore == MIN_COMPARISION_VALUE ) {
                    imgTickCenter.image = UIImage(named:"Cross")
                    imgTickCenter.tintColor = .red
                } else {
                    imgTickCenter.image = UIImage(named: "Tick")
                    imgTickCenter.tintColor = UIColor(hexString: "46B447")
                }
               
            } else {
                imgCenter.image = UIImage(named: "Water")
                lblCenter.text = "WATER"
                centerScore = waterScore

                if ( waterScore == MIN_COMPARISION_VALUE ) {
                    imgTickCenter.image = UIImage(named:"Cross")
                    imgTickCenter.tintColor = .red
                } else {
                    imgTickCenter.image = UIImage(named: "Tick")
                    imgTickCenter.tintColor = UIColor(hexString: "46B447")
                }
                
            }
            
        } else if ( count == 2 ) {
            viewLeft.isHidden = false
            viewCenter.isHidden = false
            
            viewLeft.isUserInteractionEnabled = true
            viewLeft.addGestureRecognizer(leftGesture)
            viewCenter.isUserInteractionEnabled = true
            viewCenter.addGestureRecognizer(centerGesture)
            
            if ( isProduct && isSoil ) {
                imgLeft.image = UIImage(named: "Product")
                imgCenter.image = UIImage(named: "Soil")
                lblLeft.text = "PRODUCT"
                lblCenter.text = "SOIL"
                
                leftScore = prodScore
                centerScore = soilScore
                
                if ( prodScore == MIN_COMPARISION_VALUE ) {
                    imgTickLeft.image = UIImage(named:"Cross")
                    imgTickLeft.tintColor = .red
                } else {
                    imgTickLeft.image = UIImage(named: "Tick")
                    imgTickLeft.tintColor = UIColor(hexString: "46B447")
                }
                
                if ( soilScore == MIN_COMPARISION_VALUE ) {
                    imgTickCenter.image = UIImage(named:"Cross")
                    imgTickCenter.tintColor = .red
                } else {
                    imgTickCenter.image = UIImage(named: "Tick")
                    imgTickCenter.tintColor = UIColor(hexString: "46B447")
                }
               
            } else if ( isProduct && isWater ) {
                imgLeft.image = UIImage(named: "Product")
                imgCenter.image = UIImage(named: "Water")
                lblLeft.text = "PRODUCT"
                lblCenter.text = "WATER"
                leftScore = prodScore
                centerScore = waterScore
                
                if ( prodScore == MIN_COMPARISION_VALUE ) {
                    imgTickLeft.image = UIImage(named:"Cross")
                    imgTickLeft.tintColor = .red
                } else {
                    imgTickLeft.image = UIImage(named: "Tick")
                    imgTickLeft.tintColor = UIColor(hexString: "46B447")
                }
                
                if ( waterScore == MIN_COMPARISION_VALUE ) {
                    imgTickCenter.image = UIImage(named:"Cross")
                    imgTickCenter.tintColor = .red
                } else {
                    imgTickCenter.image = UIImage(named: "Tick")
                    imgTickCenter.tintColor = UIColor(hexString: "46B447")
                }
                
            } else if ( isSoil && isWater ) {
                imgLeft.image = UIImage(named: "Soil")
                imgCenter.image = UIImage(named: "Water")
                lblLeft.text = "SOIL"
                lblCenter.text = "WATER"
                leftScore = soilScore
                centerScore = waterScore
                
                if ( soilScore == MIN_COMPARISION_VALUE ) {
                    imgTickLeft.image = UIImage(named:"Cross")
                    imgTickLeft.tintColor = .red
                } else {
                    imgTickLeft.image = UIImage(named: "Tick")
                    imgTickLeft.tintColor = UIColor(hexString: "46B447")
                }
                
                if ( waterScore == MIN_COMPARISION_VALUE ) {
                    imgTickCenter.image = UIImage(named:"Cross")
                    imgTickCenter.tintColor = .red
                } else {
                    imgTickCenter.image = UIImage(named: "Tick")
                    imgTickCenter.tintColor = UIColor(hexString: "46B447")
                }
            }
            
        } else if ( count == 3 ) {
            viewLeft.isHidden = false
            viewCenter.isHidden = false
            viewRight.isHidden = false
            imgLeft.image = UIImage(named: "Product")
            imgCenter.image = UIImage(named: "Soil")
            imgRight.image = UIImage(named: "Water")
            
            lblLeft.text = "PRODUCT"
            lblCenter.text = "SOIL"
            lblRight.text = "WATER"
            
            leftScore = prodScore
            centerScore = soilScore
            rightScore = waterScore
            
            viewCenter.isUserInteractionEnabled = true
            viewCenter.addGestureRecognizer(centerGesture)
            
            viewLeft.isUserInteractionEnabled = true
            viewLeft.addGestureRecognizer(leftGesture)
            
            viewRight.isUserInteractionEnabled = true
            viewRight.addGestureRecognizer(rightGesture)
            
            if ( prodScore == MIN_COMPARISION_VALUE ) {
                imgTickLeft.image = UIImage(named:"Cross")
                imgTickLeft.tintColor = .red
            } else {
                imgTickLeft.image = UIImage(named: "Tick")
                imgTickLeft.tintColor = UIColor(hexString: "46B447")
            }
            
            if ( soilScore == MIN_COMPARISION_VALUE ) {
                imgTickCenter.image = UIImage(named:"Cross")
                imgTickCenter.tintColor = .red
            } else {
                imgTickCenter.image = UIImage(named: "Tick")
                imgTickCenter.tintColor = UIColor(hexString: "46B447")
            }
            
            if ( waterScore == MIN_COMPARISION_VALUE ) {
                imgTickRight.image = UIImage(named:"Cross")
                imgTickRight.tintColor = .red
            } else {
                imgTickRight.image = UIImage(named: "Tick")
                imgTickRight.tintColor = UIColor(hexString: "46B447")
            }
            
        }
    }
    
    
    
    
    @IBAction func btnLeft(_ sender: Any) {
        if ( isProduct ) {
            guard let asset = sampleQC.ProductTestingAssetIDs else {
                return
            }
            
            delegate.didTapButton(asset.first?.FileAssetID ?? 0)
        } else if ( isSoil ) {
            guard let asset = sampleQC.SoilTestingAssetIDs else {
                return
            }
            
            delegate.didTapButton(asset.first?.FileAssetID ?? 0)
        }
    }
    @IBAction func btnCenter(_ sender: Any) {
        if ( isProduct ) {
            guard let asset = sampleQC.ProductTestingAssetIDs else {
                return
            }
            
            delegate.didTapButton(asset.first?.FileAssetID ?? 0)
            
        } else if ( isSoil ) {
            guard let asset = sampleQC.SoilTestingAssetIDs else {
                return
            }
            
            delegate.didTapButton(asset.first?.FileAssetID ?? 0)
            
        } else if ( isWater ) {
            guard let asset = sampleQC.WaterTestingAssetIDs else {
                return
            }
            
            delegate.didTapButton(asset.first?.FileAssetID ?? 0)
        }
    }
    @IBAction func btnRight(_ sender: Any) {
        guard let asset = sampleQC.WaterTestingAssetIDs else {
            return
        }
        
        delegate.didTapButton(asset.first?.FileAssetID ?? 0)
        
    }
}
