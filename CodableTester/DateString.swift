//
//  DateString.swift
//  CodableTester
//
//  Created by Nick Matelli on 6/14/18.
//  Copyright © 2018 Foo. All rights reserved.
//

import Foundation

struct DateString: Codable, Equatable {
    private var _date: Date
    var date: Date { return _date }
    
    private var _string: String
    var string: String { return _string }
    
    // string formats coming from typical json-encoding datestring
    static let dateTimeFormatter: DateFormatter = createDateFormatter("yyyy-MM-dd HH:mm:ss")
    static let timelessDateFormat: DateFormatter = createDateFormatter("yyyy-MM-dd")
    
    init?(string: String?) {
        // If no string passed in, consider invalid
        guard let string = string else {
            return nil
        }
        _string = string
        
        var date: Date? = DateString.dateTimeFormatter.date(from: string)
        if date == nil { // we try with another format
            date = DateString.timelessDateFormat.date(from: string)
        }
        
        guard let safeDate = date else {
            return nil
        }
        _date = safeDate
    }
    
    init?(date: Date?) {
        guard let date = date else {
            return nil
        }
        _date = date
        _string = DateString.dateTimeFormatter.string(from: date)
    }
    
    public init(from decoder: Decoder) throws {
        let string: String = try decoder.singleValueContainer().decode(String.self)
        self.init(string: string)!
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
    
    static func createDateFormatter(_ formatString: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        return dateFormatter
    }
}
