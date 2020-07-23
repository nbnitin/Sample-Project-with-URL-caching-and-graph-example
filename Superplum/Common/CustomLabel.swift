//
//  CustomLabel.swift
//  Superplum
//
//  Created by Nitin on 27/04/20.
//  Copyright © 2020 Nitin. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomLabel:UILabel {
    
    
    func getHeadingFont(fontSize:CGFloat)->UIFont {
        //uncomment if you want to remove dynamic text size support according to phone setting
        guard let customFont = UIFont(name: "Gordita-Bold", size: fontSize) else {
            fatalError("""
        Failed to load the "Gordita-Bold" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """

            )
        }
        return customFont
        
//        //comment if you want to remove dynamic text size support according to phone setting
//        guard let customFont = UIFont(name: "FiraSans-SemiBold", size: fontSize) else {
//            fatalError("""
//        Failed to load the FiraSans-Book font.
//        Make sure the font file is included in the project and the font name is spelled correctly.
//        """
//            )
//        }
//        return UIFontMetrics.default.scaledFont(for: customFont)
    }
    
     func getMediumFont(fontSize:CGFloat)->UIFont {
            //uncomment if you want to remove dynamic text size support according to phone setting
            guard let customFont = UIFont(name: "Gordita-Black", size: fontSize) else {
                fatalError("""
            Failed to load the "Gordita-Black" font.
            Make sure the font file is included in the project and the font name is spelled correctly.
            """

                )
            }
            return customFont
    }
    
    func getSmallFont(fontSize:CGFloat)->UIFont {
            //uncomment if you want to remove dynamic text size support according to phone setting
            guard let customFont = UIFont(name: "Gordita-Black", size: fontSize) else {
                fatalError("""
            Failed to load the "Gordita-Black" font.
            Make sure the font file is included in the project and the font name is spelled correctly.
            """

                )
            }
            return customFont
    }
    
    func getSmallerFont(fontSize:CGFloat)->UIFont {
            //uncomment if you want to remove dynamic text size support according to phone setting
            guard let customFont = UIFont(name: "Gordita-Bold", size: fontSize) else {
                fatalError("""
            Failed to load the "Gordita-Bold" font.
            Make sure the font file is included in the project and the font name is spelled correctly.
            """

                )
            }
            return customFont
    }
    
    func getSmallerWithFont(fontSize:CGFloat)->UIFont {
               //uncomment if you want to remove dynamic text size support according to phone setting
               guard let customFont = UIFont(name: "Gordita-Medium", size: fontSize) else {
                   fatalError("""
               Failed to load the "Gordita-Medium" font.
               Make sure the font file is included in the project and the font name is spelled correctly.
               """

                   )
               }
               return customFont
       }
       
    
     
    //headings
    @IBInspectable
    var IsHeadingFont : Bool = false {
        didSet{
            self.font = getHeadingFont(fontSize: 25)
            self.adjustsFontForContentSizeCategory = true
        }
    }
    
    
    @IBInspectable
       var IsMediumFont : Bool = false {
           didSet{
               self.font = getMediumFont(fontSize: 12)
               self.adjustsFontForContentSizeCategory = true

           }
       }
    
   @IBInspectable
         var IsSmallFont : Bool = false {
             didSet{
                 self.font = getSmallFont(fontSize: 15)
                 self.adjustsFontForContentSizeCategory = true

             }
        }
    
    @IBInspectable
     var IsSmallerFont : Bool = false {
         didSet{
             self.font = getSmallFont(fontSize: 10)
             self.adjustsFontForContentSizeCategory = true

         }
    }
    
    @IBInspectable
     var IsMediumWithBoldFont : Bool = false {
         didSet{
             self.font = getSmallFont(fontSize: 10)
             self.adjustsFontForContentSizeCategory = true

         }
    }
   
    @IBInspectable
      var IsSmallerWithMediumFont : Bool = false {
          didSet{
              self.font = getSmallFont(fontSize: 10)
              self.adjustsFontForContentSizeCategory = true

          }
     }
    
    
}
