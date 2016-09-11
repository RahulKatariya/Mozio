//
//  PatientsTableViewController.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import UIKit
import RealmSwift

class PatientsTableViewController: UITableViewController {
    
    let realm = try! Realm()
    var results: Results<Patient>!
    var notificationToken: NotificationToken? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        results = realm.objects(Patient)
        
        notificationToken = results.addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
            guard let _self = self else { return }
            switch changes {
            case .Initial, .Update(_, deletions: _, insertions: _, modifications: _):
                _self.results = _self.realm.objects(Patient)
                _self.tableView.reloadData()
            default:
                break
            }
        }
        
    }
    
    deinit {
        notificationToken = nil
    }
    
}

// MARK: - TableView Delegate and Datasoruce
extension PatientsTableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PatientTableViewCell", forIndexPath: indexPath) as! PatientTableViewCell
        
        // Configure the cell...
        let patient = results[indexPath.row]
        cell.patient = patient
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}