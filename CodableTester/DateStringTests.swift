//
//  DateStringTests.swift
//  CodableTester
//
//  Created by Nick Matelli on 6/14/18.
//  Copyright © 2018 Foo. All rights reserved.
//

/*import Foundation

import XCTest

@testable import CodableTester

class DateStringTests: XCTestCase {
    
    var epoch: Date = Date()
    
    var encoder: JSONEncoder = JSONEncoder()
    var decoder: JSONDecoder = JSONDecoder()
    
    override func setUp() {
        var interval = epoch.timeIntervalSince1970
        interval.negate()
        epoch = epoch.addingTimeInterval(interval)
    }
    
    func testInitFromDate() {
        let date = Date()
        let dateString = DateString(date: date)
        XCTAssertEqual(ComparisonResult.orderedSame, difference(date, to: dateString?.date))
    }
    
    func testInitFromString() {
        let string = "1970-01-01"
        let dateString = DateString(string: string)
        XCTAssertEqual(ComparisonResult.orderedSame, difference(epoch, to: dateString?.date))
    }
    
    func testNilInit() {
        XCTAssertNil(DateString(date: nil))
        XCTAssertNil(DateString(string: nil))
        XCTAssertNil(DateString(string: ""))
    }
    
    func testInitFromLongString() {
        let string = "1970-01-01 00:00:00"
        let dateString = DateString(string: string)
        XCTAssertEqual(ComparisonResult.orderedSame, difference(epoch, to: dateString?.date))
    }
    
    func testStringFromToday() {
        let date = Date()
        let dateString = DateString(date: date)
        let timelessString = String(dateString?.string.prefix(10) ?? "")
        let stringFromDate = stringFrom(date)
        XCTAssertEqual(stringFromDate, timelessString)
    }
    
    func testEncode() {
        guard let dateString = DateString(date: epoch) else {
            XCTFail("nil dateString unexpected")
            return
        }
        var jsonString: String?
        let expectedJsonString = "[\"1970-01-01 00:00:00\"]" // single-value wrapped in array to make valid json
        do {
            let data = try encoder.encode([dateString])
            jsonString = String(data: data, encoding: .utf8)
        } catch {
            XCTFail("Encoding dateString failed")
        }
        // NOTE if assertion on next line fails by a 1-second difference, trim of the seconds.  it's an epoch computation issue.
        XCTAssertEqual(expectedJsonString, jsonString)
    }
    
    func testEncodeTimeless() {
        guard let dateString = DateString(string: "1970-01-01") else {
            XCTFail("nil dateString unexpected")
            return
        }
        var jsonString: String?
        let expectedJsonString = "[\"1970-01-01\"]" // single-value wrapped in array to make valid json
        do {
            let data = try encoder.encode([dateString])
            jsonString = String(data: data, encoding: .utf8)
        } catch {
            XCTFail("Encoding dateString failed")
        }
        XCTAssertEqual(expectedJsonString, jsonString)
    }
    
    func testDecode() {
        let jsonString = "[\"1970-01-01 00:00:00\"]"
        guard let jsonData = jsonString.data(using: .utf8) else {
            XCTFail("Decoding dateString failed")
            return
        }
        var dateStrings: [DateString]?
        do {
            dateStrings = try decoder.decode([DateString].self, from: jsonData)
        } catch {
            XCTFail("Decoding dateString failed")
        }
        let dateString = dateStrings?.first?.date
        XCTAssertEqual(ComparisonResult.orderedSame, difference(epoch, to: dateString))
    }
    
    func testDecodeTimeless() {
        let jsonString = "[\"1970-01-01\"]"
        guard let jsonData = jsonString.data(using: .utf8) else {
            XCTFail("Decoding dateString failed")
            return
        }
        var dateStrings: [DateString]?
        do {
            dateStrings = try decoder.decode([DateString].self, from: jsonData)
        } catch {
            XCTFail("Decoding dateString failed")
        }
        let dateString = dateStrings?.first?.date
        XCTAssertEqual(ComparisonResult.orderedSame, difference(epoch, to: dateString))
    }
    
    // MARK: - Util
    
    // epoch calculation can be off by a second or two, so compare against minutes by default
    func difference(_ from: Date?, to: Date?, precision: Calendar.Component = Calendar.Component.minute) -> ComparisonResult? {
        guard let from = from, let to = to else {
            XCTFail("Nil dates unexpected")
            return nil
        }
        return Calendar.current.compare(from, to: to, toGranularity: precision)
    }
    
    // reverse compute string from date without using formatters
    func stringFrom(_ date: Date) -> String? {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        guard let year = components.year, let month = components.month, let day = components.day else {
            XCTFail("Nil date components unexpected")
            return nil
        }
        let monthString = (month < 10) ? "0\(month)" : "\(month)"
        let dayString = (day < 10) ? "0\(day)" : "\(day)"
        return "\(year)-\(monthString)-\(dayString)"
    }
}*/

