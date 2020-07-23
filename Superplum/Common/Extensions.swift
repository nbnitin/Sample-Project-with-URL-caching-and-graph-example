//
//  Extensions.swift
//  Superplum
//
//  Created by Nitin on 27/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(str:String,title:String="",buttonTitle:String="Ok",requireAutoClose:Bool=false,requireToSendToDeadScreen:Bool=false){
              
        let alert = UIAlertController(title: title, message: str, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonTitle, style: .default, handler: {(UIAlertAction) in
            
        })
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

extension UIImageView{
    func loadImage(url:String) {
        NetworkManager.shared.downloadContentGet(fromUrlString: url, contentType: .image, completionHandler: {(result) in
            
            switch result{
            case .success(let yourData) :
                DispatchQueue.main.async {
                    self.image = UIImage(data: yourData)
                }
                break
            case .failure(let err):
                print(err)
            }
        })
    }
}

extension UIColor {
    public convenience init?(hexString: String,alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if ( hexString.hasPrefix("#") ) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
    func getLighterShade(percentage:CGFloat=30.0)->UIColor {
        return self.adjustBrightness(by: percentage)
    }
    
    func adjustBrightness(by percentage: CGFloat = 30.0) -> UIColor {

        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {

            let pFactor = (100.0 + percentage) / 100.0

            let newRed = (red*pFactor).clamped(to: 0.0 ... 1.0)
            let newGreen = (green*pFactor).clamped(to: 0.0 ... 1.0)
            let newBlue = (blue*pFactor).clamped(to: 0.0 ... 1.0)

            return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: alpha)
        }

        return self
    }
}

extension Comparable {

    func clamped(to range: ClosedRange<Self>) -> Self {

        if self > range.upperBound {
            return range.upperBound
        } else if self < range.lowerBound {
            return range.lowerBound
        } else {
            return self
        }
    }
}

extension UIView {
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView,color:CGColor=UIColor.white.cgColor) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.
        
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
    func showLoad(){
        let view : UIView = self
        let rect = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let loadingSubView =  Bundle.main.loadNibNamed("loadingView", owner: self, options: nil)?[0] as! LoadingView
        loadingSubView.tag = 999
        loadingSubView.alpha = 1
        loadingSubView.backgroundColor = UIColor.clear
        loadingSubView.frame = rect
        loadingSubView.activityIndicator.startAnimating()
        loadingSubView.loadingSpinnerContainer.addCornerRadius(corners: .allCorners, radius: 10)
        view.addSubview(loadingSubView)
        self.bringSubviewToFront(loadingSubView)
    }
    
    func hideLoad(){
        _ = self.subviews.map({
            if ( $0.tag == 999 ) {
                $0.removeFromSuperview()
            }
        })
    }
    func addCornerRadius(corners:UIRectCorner,radius:CGFloat){
        // let view:UIView = self
        let maskLayer = CAShapeLayer()
        
        maskLayer.frame = self.bounds
        maskLayer.path = UIBezierPath(roundedRect:bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
        self.clipsToBounds = true
        self.layer.masksToBounds = false
    }
    
    func showMessageView(score:Int){
        let view : UIView = self
        let rect = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let messageView =  Bundle.main.loadNibNamed("MessageView", owner: self, options: nil)?[0] as! MessageView
        
        var foregroundColor : UIColor!
        var backgroundColor : UIColor!
        var message : String!
        var img : UIImage!
        
        switch score {
        case 1:
            foregroundColor = .white
            backgroundColor = NetworkManager.shared.primaryColor
            message = "Residue levels high. Unsafe to eat."
            img = UIImage(named:"Cross")
        case 2:
            foregroundColor = .white
            backgroundColor = NetworkManager.shared.secondaryColor
            message = "Safe to eat. Residue levels found safe"
            img = UIImage(named: "Tick")
        case 3:
            foregroundColor = NetworkManager.shared.primaryColor
            backgroundColor = .white
            message = "No Pesticides or harmful chemicals detected"
            img = UIImage(named: "Tick")
        default:
            break
        }
        
        messageView.tag = 9999
        messageView.alpha = 1
        messageView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        messageView.frame = rect
        let tapGestureToClose = UITapGestureRecognizer(target: self, action: #selector(hideMessage))
        messageView.addGestureRecognizer(tapGestureToClose)
        messageView.isUserInteractionEnabled = true
        messageView.messageContainerView.addCornerRadius(corners: .allCorners, radius: 10)
        messageView.alpha = 0.0
        messageView.imgTick.image = img
        messageView.imgTick.tintColor = foregroundColor
        messageView.lblMessage.textColor = foregroundColor
        messageView.messageContainerView.backgroundColor = backgroundColor
        messageView.lblMessage.text = message
        view.addSubview(messageView)
        self.bringSubviewToFront(messageView)
        
        UIView.animate(withDuration: 0.3, animations: {
            messageView.alpha = 1
        }, completion: nil)
    }
    
    @objc func hideMessage(){
        _ = self.subviews.map({
            if ( $0.tag == 9999 ) {
                $0.removeFromSuperview()
            }
        })
    }
}

