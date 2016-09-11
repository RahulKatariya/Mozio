//
//  AlertUtils.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import UIKit

class AlertUtils {
    
    func showAlertWithMessage(message: String, onViewController viewController: UIViewController) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(cancelAction)
        viewController.presentViewController(alertController, animated: true, completion: nil)
    }

}