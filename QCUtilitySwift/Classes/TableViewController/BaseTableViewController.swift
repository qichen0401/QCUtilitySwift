//
//  BaseTableViewController.swift
//  Pods
//
//  Created by Qi Chen on 6/14/17.
//
//

import UIKit

open class BaseTableViewController: UITableViewController {

    public struct Constants {
        public static let reuseIdentifier = "reuseIdentifier"
    }
    
    open var emptyTableFooterView: UIView? {
        didSet {
            emptyTableFooterView?.frame = self.view.bounds
            
            configureTableFooterView()
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        registerForCellReuseIdentifier()
        
        configureTableFooterView()
    }
    
    open func registerForCellReuseIdentifier() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
    }
    
    func configureTableFooterView() {
        if tableView.numberOfSections == 0 {
            tableView.tableFooterView = emptyTableFooterView ?? UIView()
        } else {
            tableView.tableFooterView = UIView()
        }
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        
        // Configure the cell...
        configure(cell, at: indexPath)
        
        return cell
    }
    
    open func configure(_ cell: UITableViewCell, at indexPath: IndexPath) {
        
    }
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
