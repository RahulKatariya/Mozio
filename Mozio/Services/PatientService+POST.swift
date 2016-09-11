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

/// Creats a new `Patient` object at the server
///
/// curl -X POST \
/// -H "Content-Type: application/json" \
/// -H "X-Parse-Application-Id: NmuqsrwKlme72R8UI0fnQP4sFrRSAoEJI0klQf5x" \
/// -H "X-Parse-REST-API-Key: R8O8z6VpLgb2XRi3vA8wgBaUs3nXGWCbJyp1yZ3w" \
/// -d "{\"age\":12,\"useDrugs\":false,\"gender\":\"Female\",\"hasMigranes\":false,\"name\":\"Rahul\"}" \
/// https://api.parse.com/1/classes/Patient
struct PatientPOSTService: Requestable {

    typealias Model = [String: AnyObject]
    var path: String = "Patient"
    var method = Alamofire.Method.POST
    var parameters: AnyObject? 

    init(params: AnyObject? = nil) { 
        parameters = params
    }

}

// MARK: - Caching
import RealmSwift
import SwiftyJSON

extension PatientPOSTService {
    
    ///  Parses the reponse and fetches the newly created `Patient` object
    ///  from the server by the `objectId`
    ///
    ///  - parameter response: The `response` received from server
    func didCompleteRequestWithResponse(response: Response<Model, NSError>) {
        guard let model = response.result.value else { return }
        if let objectId = JSON(model).dictionaryValue["objectId"] {
            PatientGETService(id: objectId.stringValue).executeTaskEventually()
        }
        
    }
    
}