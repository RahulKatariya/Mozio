//     _____                  ____  __.
//    /  _  \ _____ _______  |    |/ _|____  ___.__.
//   /  /_\  \\__  \\_  __ \ |      < \__  \<   |  |
//  /    |    \/ __ \|  | \/ |    |  \ / __ \\___  |
//  \____|__  (____  /__|    |____|__ (____  / ____|
//          \/     \/                \/    \/\/
//
//  Copyright (c) 2016 RahulKatariya. All rights reserved.
//

import Restofire
import Alamofire

/// Fetches a singe `Patient` object from the given id
///
/// curl -X GET \
/// -H "Content-Type: application/json" \
/// -H "X-Parse-Application-Id: NmuqsrwKlme72R8UI0fnQP4sFrRSAoEJI0klQf5x" \
/// -H "X-Parse-REST-API-Key: R8O8z6VpLgb2XRi3vA8wgBaUs3nXGWCbJyp1yZ3w" \
/// https://api.parse.com/1/classes/Patient/qqvkyYs08u
struct PatientGETService: Requestable {

    typealias Model = [String: AnyObject]
    var path: String = "" 

    init(id: String) { 
        path = "Patient/\(id)"
    }

}

// MARK: - Caching
import RealmSwift
import SwiftyJSON

extension PatientGETService {
    
    ///  Writes the patient object to the Realm Database when the request is completed successfully
    ///
    ///  - parameter response: The response received from server
    func didCompleteRequestWithResponse(response: Response<Model, NSError>) {
        guard let model = response.result.value else { return }
        let jsonPatient = JSON(model)
        let realm = try! Realm()
        let patient = Patient.fromJSON(jsonPatient)
        try! realm.write {
            realm.add(patient, update: true)
        }
    }
    
}