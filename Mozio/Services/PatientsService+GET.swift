//
//  PatientsService+GET.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import Restofire
import Alamofire

/// Fetches all `Patient` objects from the server
///
/// curl -X GET \
/// -H "Content-Type: application/json" \
/// -H "X-Parse-Application-Id: NmuqsrwKlme72R8UI0fnQP4sFrRSAoEJI0klQf5x" \
/// -H "X-Parse-REST-API-Key: R8O8z6VpLgb2XRi3vA8wgBaUs3nXGWCbJyp1yZ3w" \
/// https://api.parse.com/1/classes/Patient
struct PatientsGETService: Requestable {

    typealias Model = [String: AnyObject]
    var path: String = "Patient" 

}

// MARK: - Caching
import RealmSwift
import SwiftyJSON

extension PatientsGETService {
    
    ///  Writes all the patients to the Realm Database when the request is completed successfully
    ///
    ///  - parameter response: The response received from server
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