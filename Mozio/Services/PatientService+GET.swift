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