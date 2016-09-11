//
//  PatientTableViewCell.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import UIKit

class PatientTableViewCell: UITableViewCell {
    
    var patient: Patient! {
        didSet {
            /// Update UI
            if let p = patient {
                nameLabel.text = "\(p.name)"
                ageLabel.text = "\(p.age) yrs"
                genderLabel.text = "\(p.genderRaw)"
                let tsp = ToddSyndromeProbabilty.checkPatient(p).calculatePercentage()
                toddSyndromePercentageLabel.text = "\(tsp)% chances"
                backgroundColor = UIColor.redColor().colorWithAlphaComponent(CGFloat(tsp)/100)
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var toddSyndromePercentageLabel: UILabel!
    
}
