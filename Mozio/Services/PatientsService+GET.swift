//
//  PatientsService+GET.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import Restofire
import Alamofire

struct PatientsGETService: Requestable {

    typealias Model = [String: AnyObject]
    var path: String = "Patient" 

}

// MARK: - Caching
import RealmSwift
import SwiftyJSON

extension PatientsGETService {
    
    func didCompleteRequestWithResponse(response: Response<Model, NSError>) {
        guard let model = response.result.value else { return }
        let realm = try! Realm()
        let jsonPatient = JSON(model)
        if let results = jsonPatient["results"].array {
            for result in results {
                let patient = Patient()
                patient.objectId = result["objectId"].stringValue
                patient.name = result["name"].stringValue
                patient.age = result["age"].numberValue.integerValue
                patient.hasMigranes = result["hasMigranes"].boolValue
                patient.useDrugs = result["useDrugs"].boolValue
                patient.genderRaw = result["gender"].stringValue
                try! realm.write {
                    realm.add(patient, update: true)
                }
            }
        }
    }
    
}