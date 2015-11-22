//
//  ViewController.swift
//  Bubble Tea Finder
//
//  Created by Pietro Rea on 8/24/14.
//  Copyright (c) 2014 Pietro Rea. All rights reserved.
//

import UIKit
import CoreData

let filterViewControllerSegueIdentifier = "toFilterViewController"
let venueCellIdentifier = "VenueCell"

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var coreDataStack: CoreDataStack!
    var fetchRequest: NSFetchRequest!
    var venues: [Venue]!
  
  override func viewDidLoad() {
    super.viewDidLoad()

//    let model = coreDataStack.context.persistentStoreCoordinator!.managedObjectModel
//    fetchRequest = model.fetchRequestTemplateForName("FetchRequest")
//    fetchAndReload()
    
    fetchRequest = NSFetchRequest(entityName: "Venue")
    
    fetchAndReload()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == filterViewControllerSegueIdentifier {
        let navController = segue.destinationViewController as! UINavigationController
        let filterVC = navController.topViewController as! FilterViewController
        
        filterVC.coreDataStack = coreDataStack
        filterVC.delegate = self
    }
  }
  
  @IBAction func unwindToVenuListViewController(segue: UIStoryboardSegue) {
    
  }
}

extension ViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
    return venues.count
  }

  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(venueCellIdentifier)!

    let venue = venues[indexPath.row]
    cell.textLabel!.text = venue.name
    cell.detailTextLabel!.text = venue.priceInfo?.priceCategory
    
    return cell
  }
    
    func fetchAndReload() {
        do {
            venues =
                try coreDataStack.context.executeFetchRequest(fetchRequest) as! [Venue]
            tableView.reloadData()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
}

extension ViewController: FilterViewControllerDelegate {
    func filterViewController(filter: FilterViewController, didSelectPredicate predicate: NSPredicate?, sortDescription: NSSortDescriptor?) {
        fetchRequest.predicate = nil
        fetchRequest.sortDescriptors = nil
        
        if let fetchPredicate = predicate {
            fetchRequest.predicate = fetchPredicate
        }
        
        if let sr = sortDescription {
            fetchRequest.sortDescriptors = [sr]
        }
        
        fetchAndReload()
    }
}
