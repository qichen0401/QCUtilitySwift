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
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        registerForCellReuseIdentifier()
    }
    
    open func registerForCellReuseIdentifier() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
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

}
