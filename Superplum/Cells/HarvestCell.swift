//
//  HarvestCell.swift
//  Superplum
//
//  Created by Nitin on 24/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit

class HarvestCell: UITableViewCell {
    
    @IBOutlet weak var lblKnowYourFruit: UILabel!
    
    var harvestSubView : [UIView] = [UIView]()
    
    
//    func makeLine(){
//        view1.drawDottedLine(start: CGPoint(x: view1.bounds.minX, y: view1.frame.height), end: CGPoint(x: view1.bounds.maxX, y: view1.frame.height), view: view1)
//
//        view2.drawDottedLine(start: CGPoint(x: view2.bounds.minX, y: view2.frame.height), end: CGPoint(x: view2.bounds.maxX, y: view2.frame.height), view: view2)
//        view3.drawDottedLine(start: CGPoint(x: view3.bounds.minX, y: view3.frame.height), end: CGPoint(x: view3.bounds.maxX, y: view3.frame.height), view: view3)
//        view4.drawDottedLine(start: CGPoint(x: view4.bounds.minX, y: view4.frame.height), end: CGPoint(x: view4.bounds.maxX, y: view4.frame.height), view: view4)
//        view5.drawDottedLine(start: CGPoint(x: view5.bounds.minX, y: view5.frame.height), end: CGPoint(x: view5.bounds.maxX, y: view5.frame.height), view: view5)
//        view6.drawDottedLine(start: CGPoint(x: view6.bounds.minX, y: view6.frame.height), end: CGPoint(x: view6.bounds.maxX, y: view6.frame.height), view: view6)
//
//    }
//
    
    
    func setupData() {
        
        //removing old already added subview to remove duplicacy
        for view in harvestSubView {
            view.removeFromSuperview()
        }
        
        guard let batch = NetworkManager.shared.model.Batch else {
            return
        }
        
        guard let productVariant = NetworkManager.shared.model.ProductVariant else {
            return
        }
        
        let nextX :CGFloat = 16
        var nextY = lblKnowYourFruit.frame.height + lblKnowYourFruit.frame.origin.y + 11
        
        if let diameter = batch.Diameter {
            let result = String(format: "%.2f", diameter)
            self.createAndAddSubViews(xPosition: nextX, yPosition: nextY, title: "Average Size", value: "\(result)mm")
            nextY += 34 + 8
        }


        if let weight = batch.AvgWeight {
            let result = String(format: "%.2f", weight)
            self.createAndAddSubViews(xPosition: nextX, yPosition: nextY, title: "Average Weight", value: "\(result)gm")
            nextY += 34 + 8
        }

        if let color = productVariant.ColorName {
            self.createAndAddSubViews(xPosition: nextX, yPosition: nextY, title: "Colour", value: color)
            nextY += 34 + 8
        }


        if let tss = batch.TSS {
            self.createAndAddSubViews(xPosition: nextX, yPosition: nextY, title: "Batch TSS", value: "\(tss)")
            nextY += 34 + 8
        }

        if let acidity = batch.Acidity {
            let result = String(format: "%.2f", acidity)
            self.createAndAddSubViews(xPosition: nextX, yPosition: nextY, title: "Batch Acidity", value: "\(result)%")
            nextY += 34 + 8
        }

        if let tss = batch.TSS,let acidity = batch.Acidity {
            let result = (tss/acidity)
            self.createAndAddSubViews(xPosition: nextX, yPosition: nextY, title: "Sugar/Acidity Ratio", value: String(format: "%.2f", result),makeLine: false)
            nextY += 34 + 8
        }

    }
    
    //Mark:- create harvest sub views
    private func createAndAddSubViews(xPosition:CGFloat,yPosition:CGFloat,title:String,value:String,makeLine:Bool=true){
        let harvestSubView =  Bundle.main.loadNibNamed("HarvestSubView", owner: self, options: nil)?[0] as! HarvestSubView
               harvestSubView.frame = CGRect(x: xPosition, y: yPosition, width: self.frame.width - 32, height: 34)
        harvestSubView.lblTitle.text = title
        harvestSubView.lblValue.text = value
        harvestSubView.backgroundColor = .clear
        harvestSubView.lblTitle.textColor = .white
        harvestSubView.lblValue.textColor = .white
        
        if ( makeLine ) {
            harvestSubView.drawDottedLine(start: CGPoint(x:harvestSubView.lblTitle.bounds.minX, y:34),end:CGPoint(x:self.bounds.maxX - 32,y:34), view: harvestSubView)
        }
        //adding harvest view to keep track
        self.harvestSubView.append(harvestSubView)
        
        self.addSubview(harvestSubView)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
