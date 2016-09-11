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
                let patient = Patient.fromJSON(result)
                try! realm.write {
                    realm.add(patient, update: true)
                }
            }
        }
    }
    
}