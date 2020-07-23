//
//  DateFormatters.swift
//  Superplum
//
//  Copyright © 2020 Nitin. All rights reserved.
//

import Foundation

class DateFormatters{
    
    static let shared = DateFormatters()
    
    lazy var dateFormatterLocal : DateFormatter =  {
        [unowned self] in
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        return dateFormatter
    }()
    
    lazy var dateFormatterLocalWithoutMillis : DateFormatter =  {
        [unowned self] in
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }()
    
    lazy var dateFormatterLocal2 : DateFormatter =  {
        [unowned self] in
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "UTC") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()
   
}
