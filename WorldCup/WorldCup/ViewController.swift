//
//  ViewController.swift
//  WorldCup
//
//  Created by Pietro Rea on 8/2/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit
import CoreData

private let teamCellIdentifier = "teamCellReuseIdentifier"

class ViewController: UIViewController {
  
  var coreDataStack: CoreDataStack!
    
    var fetchedResultsController: NSFetchedResultsController!
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var addButton: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1
    let fetchRequest = NSFetchRequest(entityName: "Team")
    let sortDescriptor = NSSortDescriptor(key: "teamName", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    // 2
    fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: coreDataStack.context, sectionNameKeyPath: "qualifyingZone", cacheName: nil)
    
    // 3
       do {
            try fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.localizedDescription)")
        }

  }
  
  func configureCell(cell: TeamCell, indexPath: NSIndexPath) {
    let team = fetchedResultsController.objectAtIndexPath(indexPath) as! Team
    
    cell.flagImageView.image = UIImage(named: team.imageName!)
    cell.teamLabel.text = team.teamName
    cell.scoreLabel.text = "Wins:\(team.wins!)"
  }
}

extension ViewController: UITableViewDataSource {
  
  func numberOfSectionsInTableView
    (tableView: UITableView) -> Int {
      
        return fetchedResultsController.sections!.count
  }
  
  func tableView(tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
      
        let sectionInfo = fetchedResultsController.sections![section]
      return sectionInfo.numberOfObjects
  }
  
  func tableView(tableView: UITableView,
    cellForRowAtIndexPath indexPath: NSIndexPath)
    -> UITableViewCell {
      
      let cell =
      tableView.dequeueReusableCellWithIdentifier(
        teamCellIdentifier, forIndexPath: indexPath)
        as! TeamCell
      
      configureCell(cell, indexPath: indexPath)
      
      return cell
  }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.name
    }
}

extension ViewController: UITableViewDelegate {
  
  func tableView(tableView: UITableView,
    didSelectRowAtIndexPath indexPath: NSIndexPath) {
      let team = fetchedResultsController.objectAtIndexPath(indexPath) as! Team
        
        let wins = team.wins!.integerValue
        team.wins = NSNumber(integer: wins + 1)
        coreDataStack.saveContext()
        
        tableView.reloadData()
        
  }
}
