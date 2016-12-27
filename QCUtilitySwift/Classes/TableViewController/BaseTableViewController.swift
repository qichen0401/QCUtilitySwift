//
//  BaseTableViewController.swift
//  Pods
//
//  Created by Qi Chen on 12/26/16.
//
//

import UIKit

open class BaseTableViewController: UITableViewController {

    open var dataSource: [[Any]]! {
        didSet {
            tableView.reloadData()
        }
    }
    
    open func object(at indexPath: IndexPath) -> Any {
        return dataSource[indexPath.section][indexPath.row]
    }
    
    open func insert(object:Any, at indexPath: IndexPath) {
        dataSource[indexPath.section].insert(object, at: indexPath.row)
    }
    
    open func removeObject(at indexPath: IndexPath) {
        dataSource[indexPath.section].remove(at: indexPath.row)
    }
    
    open func moveObject(from fromIndexPath: IndexPath, to toIndexPath:IndexPath) {
        let obj = object(at: fromIndexPath)
        removeObject(at: fromIndexPath)
        insert(object: obj, at: toIndexPath)
    }
    
    open func removeIfEmpty(section: Int) -> Bool {
        if dataSource[section].count == 0 {
            dataSource.remove(at: section)
            return true
        } else {
            return false
        }
    }
        
    open var supportDelete = true
    open var supportRearranging = true
    
    public struct Constants {
        public static let reuseIdentifier = "reuseIdentifier"
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        registerForCellReuseIdentifier()
    }
    
    open func registerForCellReuseIdentifier() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
    }

    // MARK: - Table view data source

    override open func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }

    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)

        // Configure the cell...
        configure(cell, at: indexPath)

        return cell
    }
    
    //overrider
    open func configure(_ cell: UITableViewCell, at indexPath: IndexPath) {
//        if let obj = object(at: indexPath) as? String {
//            cell.textLabel?.text = obj
//        }
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
            removeObject(at: indexPath)
            if removeIfEmpty(section: indexPath.section) {
                tableView.deleteSections([indexPath.section], with: .fade)
            } else {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override open func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveObject(from: fromIndexPath, to: to)
        if removeIfEmpty(section: fromIndexPath.section) {
            tableView.deleteSections([fromIndexPath.section], with: .fade)
        }
    }

    // Override to support conditional rearranging of the table view.
    override open func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return supportRearranging
    }

    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
