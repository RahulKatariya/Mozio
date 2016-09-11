//
//  Patient.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import Foundation

struct Patient {
    
    let age: Int
    let name: String
    let gender: Gender
    let hasMigranes: Bool
    let useDrugs: Bool
    
    enum Gender: String {
        case Male = "Male"
        case Female = "Female"
        
        static let allValues: [Gender] = [.Male, .Female]
    }

}

