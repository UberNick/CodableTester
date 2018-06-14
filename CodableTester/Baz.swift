//
//  Baz.swift
//  CodableTester
//
//  Created by Nick Matelli on 6/14/18.
//  Copyright © 2018 Foo. All rights reserved.
//

import Foundation

struct Baz: Codable, Equatable {
    var id: Int
    var foreignKey: Int
    var integer: Int
    var booleanValue: Bool
    var nestedDictionary: NestedDictionary
}
