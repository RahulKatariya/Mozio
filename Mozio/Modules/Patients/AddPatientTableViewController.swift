//
//  AddPatientTableViewController.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import UIKit

class AddPatientTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var useDrugsSwitch: UISwitch!
    @IBOutlet weak var hasMigraneSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func closeBarButtonItemTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneBarButtonItemTapped(sender: AnyObject) {
        /// Validate Name
        guard let name = nameTextField.text where name.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).characters.count > 0 else {
            AlertUtils().showAlertWithMessage("Please enter the patient's name", onViewController: self)
            return
        }
        /// Validate Age
        guard let age = ageTextField.text where age.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).characters.count > 0 else {
            AlertUtils().showAlertWithMessage("Please enter the patient's age", onViewController: self)
            return
        }
        let patient = Patient()
        patient.name = name
        patient.age = Int(age)!
        patient.genderRaw = Patient.Gender.allValues[genderSegmentedControl.selectedSegmentIndex].rawValue
        patient.hasMigranes = hasMigraneSwitch.on
        patient.useDrugs = useDrugsSwitch.on
        
        /// Save `Patient` object on the server
        PatientPOSTService(params: patient.toJSON().dictionaryObject).executeTaskEventually { [weak self] response in
            guard let _ = response.result.value else {
                if let _weakSelf = self {
                    AlertUtils().showAlertWithMessage(response.result.error!.localizedDescription, onViewController: _weakSelf)
                }
                return
            }
            self?.dismissViewControllerAnimated(true, completion: nil)
        }
    }

}