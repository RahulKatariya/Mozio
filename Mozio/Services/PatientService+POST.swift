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
    
    func didCompleteRequestWithResponse(response: Response<Model, NSError>) {
        guard let model = response.result.value else { return }
        if let objectId = JSON(model).dictionaryValue["objectId"] {
            PatientGETService(id: objectId.stringValue).executeTaskEventually()
        }
        
    }
    
}