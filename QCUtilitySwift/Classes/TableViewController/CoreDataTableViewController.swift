//
//  CoreDataTableViewController.swift
//  CoreDataTableViewDemoSwift
//
//  Created by Qi Chen on 12/6/16.
//  Copyright © 2016 Qi Chen. All rights reserved.
//

import UIKit
import CoreData

open class CoreDataTableViewController: BaseTableViewController, NSFetchedResultsControllerDelegate {
    
    public enum SectionTitleType {
        case none
        case name
        case index
    }

    public var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>! {
        didSet {
            fetchedResultsController.delegate = self
            performFetch()
        }
    }
    /*
     let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "entityName")
     fetchRequest.sortDescriptors = [NSSortDescriptor(key: "key", ascending: true)]
     
     fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.shared.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
     */
    public var supportDelete = true
    public var sectionTitleType = SectionTitleType.index
    
    public func performFetch() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to performFetch: \(error)")
        }
    }
    
    public func object(for cell: UITableViewCell) -> NSFetchRequestResult? {
        if let indexPath = tableView.indexPath(for: cell) {
            let object = fetchedResultsController.object(at: indexPath)
            return object
        } else {
            return nil
        }
    }

    // MARK: - Table view data source

    override open func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections![section].numberOfObjects
    }

    //overrider
    open override func configure(_ cell: UITableViewCell, at indexPath: IndexPath) {
        /*
        let object = fetchedResultsController.object(at: indexPath) as! SomeClass
        // Populate cell from the NSManagedObject instance
        print("Object for configuration: \(object)")
         */
    }
    
    // Override to support conditional editing of the table view.
    override open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return supportDelete
    }

    // Override to support editing the table view.
    override open func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let object = fetchedResultsController.object(at: indexPath) as! NSManagedObject
            fetchedResultsController.managedObjectContext.delete(object)
            saveContext()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionInfo = fetchedResultsController.sections![section]
        switch sectionTitleType {
        case .none:
            return nil
        case .name:
            return sectionInfo.name
        case .index:
            return sectionInfo.indexTitle
        }
    }
    
    override open func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if sectionTitleType == .index {
            return fetchedResultsController.sectionIndexTitles
        } else {
            return nil
        }
    }
    
    override open func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return fetchedResultsController.section(forSectionIndexTitle: title, at: index)
    }
    
    public func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move:
            break
        case .update:
            break
        }
    }
    
    public func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            configure(tableView.cellForRow(at: indexPath!)!, at: indexPath!)
        case .move:
            tableView.moveRow(at: indexPath!, to: newIndexPath!)
        }
    }
    
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    // MARK: - Core Data Saving support
    
    public func saveContext () {
        let context = fetchedResultsController.managedObjectContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
