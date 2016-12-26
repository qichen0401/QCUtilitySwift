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
    
    struct Constants {
        static let reuseIdentifier = "reuseIdentifier"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

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
    
    open func object(at indexPath: IndexPath) -> Any {
        return dataSource[indexPath.section][indexPath.row]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */



}
