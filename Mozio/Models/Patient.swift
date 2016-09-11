//
//  Patient.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import RealmSwift

class Patient: Object {
    
    dynamic var objectId: String = ""
    dynamic var age: Int = 0
    dynamic var name: String = ""
    dynamic var genderRaw = "Male"
    var gender: Gender! {
        return Gender(rawValue: genderRaw)!
    }
    dynamic var hasMigranes: Bool = false
    dynamic var useDrugs: Bool = false
    
    enum Gender: String {
        case Male = "Male"
        case Female = "Female"
        
        static let allValues: [Gender] = [.Male, .Female]
    }

    override static func primaryKey() -> String? {
        return "objectId"
    }
    
}