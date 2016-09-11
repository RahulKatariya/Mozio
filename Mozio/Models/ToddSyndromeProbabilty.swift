//
//  ToddSyndrome.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import Foundation

enum ToddSyndromeProbabilty: Int {
    
    case Unlikely
    case Low
    case Normal
    case High
    case Likely
    
    static let minimumAge = 15
    static let allValues: [ToddSyndromeProbabilty] = [.Unlikely, .Low, .Normal, .High, .Likely]
    
    func calculatePercentage() -> Int {
        let percentage = 100/(ToddSyndromeProbabilty.allValues.count-1)
        return self.rawValue * percentage
    }
    
    static func checkPatient(patient: Patient) -> ToddSyndromeProbabilty {
        var probabilty = ToddSyndromeProbabilty.Unlikely.rawValue
        
        if patient.age <= minimumAge { probabilty += 1 }
        if patient.useDrugs { probabilty += 1 }
        if patient.hasMigranes { probabilty += 1 }
        if patient.gender == .Male { probabilty += 1 }
        
        guard let tsp = ToddSyndromeProbabilty(rawValue: probabilty) else {
            fatalError("Integer value `Probabilty` \(probabilty) can not be greater than `allValues.count` \(allValues.count)")
        }
        
        return tsp
        
    }
    
}