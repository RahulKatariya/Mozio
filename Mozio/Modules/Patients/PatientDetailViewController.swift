//
//  PatientDetailViewController.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import UIKit

class PatientDetailViewController: UIViewController {
    
    var patient: Patient!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var useDrugsLabel: UILabel!
    @IBOutlet weak var hasMigranesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = patient.name
        ageLabel.text = "\(patient.age)"
        genderLabel.text = patient.genderRaw
        useDrugsLabel.text = patient.useDrugs.description
        hasMigranesLabel.text = patient.hasMigranes.description
        
    }
}

