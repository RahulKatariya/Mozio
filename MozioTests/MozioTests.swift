//
//  MozioTests.swift
//  MozioTests
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import XCTest
@testable import Mozio

class MozioTests: XCTestCase {
    
    var patient: Patient!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToddSyndromePercantage() {
        let unlikelyProbabilty = ToddSyndromeProbabilty.Unlikely
        XCTAssert(unlikelyProbabilty.calculatePercentage() ==  0)
    
        let lowProbabilty = ToddSyndromeProbabilty.Low
        XCTAssert(lowProbabilty.calculatePercentage() == 25)
    
        let normalProbabilty = ToddSyndromeProbabilty.Normal
        XCTAssert(normalProbabilty.calculatePercentage() ==  50)
    
        let highProbabilty = ToddSyndromeProbabilty.High
        XCTAssert(highProbabilty.calculatePercentage() ==  75)
    
        let likelyProbabilty = ToddSyndromeProbabilty.Likely
        XCTAssert(likelyProbabilty.calculatePercentage() ==  100)
    }
    
    func testToddSyndromeProbabiltyUnlikely() {
        patient = Patient()
        patient.age = 25
        patient.name = "Lisa"
        patient.genderRaw = Patient.Gender.Female.rawValue
        patient.hasMigranes = false
        patient.useDrugs = false
        let probabilty = ToddSyndromeProbabilty.checkPatient(patient)
        XCTAssert(probabilty == .Unlikely)
    }
    
    func testToddSyndromeProbabiltyLow() {
        patient = Patient()
        patient.age = 25
        patient.name = "Rahul"
        patient.genderRaw = Patient.Gender.Male.rawValue
        patient.hasMigranes = false
        patient.useDrugs = false
        let probabilty = ToddSyndromeProbabilty.checkPatient(patient)
        XCTAssert(probabilty == .Low)
    }
    
    func testToddSyndromeProbabiltyNormal() {
        patient = Patient()
        patient.age = 15
        patient.name = "Rahul"
        patient.genderRaw = Patient.Gender.Male.rawValue
        patient.hasMigranes = false
        patient.useDrugs = false
        let probabilty = ToddSyndromeProbabilty.checkPatient(patient)
        XCTAssert(probabilty == .Normal)
    }
    
    func testToddSyndromeProbabiltyHigh() {
        patient = Patient()
        patient.age = 14
        patient.name = "Rahul"
        patient.genderRaw = Patient.Gender.Male.rawValue
        patient.hasMigranes = true
        patient.useDrugs = false
        let probabilty = ToddSyndromeProbabilty.checkPatient(patient)
        XCTAssert(probabilty == .High)
    }
    
    func testToddSyndromeProbabiltyLikely() {
        patient = Patient()
        patient.age = 13
        patient.name = "Rahul"
        patient.genderRaw = Patient.Gender.Male.rawValue
        patient.hasMigranes = true
        patient.useDrugs = true
        let probabilty = ToddSyndromeProbabilty.checkPatient(patient)
        XCTAssert(probabilty == .Likely)
        
    }

}
