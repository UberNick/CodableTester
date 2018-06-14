//
//  Bar.swift
//  CodableTester
//
//  Created by Nick Matelli on 6/14/18.
//  Copyright © 2018 Foo. All rights reserved.
//

import Foundation

struct Bar: Codable, Equatable {
    var id: Int
    var description: String
    var type: String
    
    struct NestedObject: Codable, Equatable {
        var id: Int
        var foreignKey: Int
        var booleanValue: Bool
        var nestedDictionary: NestedDictionary
        
        struct MoreNestedObject: Codable, Equatable {
            var id: Int
            var type: String
            
            struct EvenMoreNestedObject: Codable, Equatable {
                var id: Int
                var foreignKey: Int
                var arrayOfInts: [Int]
            }
            var evenMoreNestedObjects: [EvenMoreNestedObject]
        }
        var moreNestedObjects: [MoreNestedObject]
    }
    var nestedObjects: [NestedObject]
    
    struct OtherNestedObject: Codable, Equatable {
        var id: Int
        var nestedDictionary: NestedDictionary
        var foreignKey: Int
        var type: String
    }
    var otherNestedObjects: [OtherNestedObject]
}
