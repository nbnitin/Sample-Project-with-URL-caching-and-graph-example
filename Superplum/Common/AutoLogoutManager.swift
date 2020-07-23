//
//  AutoLogoutManager.swift
//  Superplum
//
//
//  Copyright © 2020 Nitin. All rights reserved.
//
//this class is responsible to autologout user from the application

import Foundation
import UIKit

fileprivate var timer : Timer!

@objc public class CatchAllGesture : UIGestureRecognizer {

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
    }
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        //reset your timer here
        state = .failed
        resetTimer()
        super.touchesEnded(touches, with: event)
    }
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
    }
    
    func resetTimer(){
        timer.invalidate()
        timer = startTimer()
    }
    
    func startTimer()->Timer{
      return  Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: {_ in
            NotificationCenter.default.post(name:.TimeOutUserInteraction, object: nil)
        })
    }
}

//extension for notification
extension NSNotification.Name {
   public static let TimeOutUserInteraction: NSNotification.Name = NSNotification.Name(rawValue: "TimeOutUserInteraction")
}

//extension for app delegate
@objc extension AppDelegate {
    func addGesture () {
        let aGesture = CatchAllGesture(target: nil, action: nil)
        aGesture.cancelsTouchesInView = false
        self.window!.addGestureRecognizer(aGesture)
        timer = aGesture.startTimer()
    }
}
