//
//  Foo.swift
//  CodableTester
//
//  Created by Nick Matelli on 6/14/18.
//  Copyright © 2018 Foo. All rights reserved.
//

import Foundation

struct Foo: Codable, Equatable {
    var id: Int
    var integer: Int
    var type: String
    var boolean: Bool
    var optionalField: String?
    var nestedDictionary: NestedDictionary
}

// NOTE this struct definition can be inline.  only downside is we'll have to refer
// to it as Foo.NestedDictionary instead of just NestedDictionary" if it's reused elsewhere
struct NestedDictionary: Codable, Equatable {
    var thing1: String
    var thing2: String
    var thing3: String
}
