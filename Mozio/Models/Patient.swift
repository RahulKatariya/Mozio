//
//  Patient.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class Patient: Object {
    
    dynamic var objectId: String = ""
    dynamic var age: Int = 0
    dynamic var name: String = ""
    dynamic var genderRaw = "Male"
    // Issue - https://github.com/realm/realm-cocoa/issues/921
    var gender: Gender? {
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
    
    static func fromJSON(result: JSON) -> Patient {
        let patient = Patient()
        patient.objectId = result["objectId"].stringValue
        patient.name = result["name"].stringValue
        patient.age = result["age"].numberValue.integerValue
        patient.hasMigranes = result["hasMigranes"].boolValue
        patient.useDrugs = result["useDrugs"].boolValue
        patient.genderRaw = result["gender"].string ?? Gender.Male.rawValue
        return patient
    }
    
    func toJSON() -> JSON {
        let json = JSON(["name": name, "age": age, "hasMigranes": hasMigranes, "useDrugs": useDrugs, "gender": gender!.rawValue])
        return json
    }
    
}