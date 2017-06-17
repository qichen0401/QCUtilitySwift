//
//  ViewController.swift
//  QCUtilitySwift
//
//  Created by Qi Chen on 12/01/2016.
//  Copyright (c) 2016 Qi Chen. All rights reserved.
//

import UIKit
import QCUtilitySwift

class ViewController: DataSourceTableViewController {

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        dataSource = []
//        rawData = ["aaa", "bbb"]

        
        
        
        let testView = UIView(frame: CGRect(center: view.center, size: CGSize(width: 100, height: 100)))
        testView.backgroundColor = UIColor.brown
        self.view.addSubview(testView)
        
        
//        rawData = []
        
//        let data = FileManager.default.plist(fileName: "testFile")!
//        let tdata: Set = data as! Set<String>
        
        
        
//        let a = Date().string(dateStyle: .full, timeStyle: .none)
//        let d = Date()
//        
//        let c = d.dateOnly()
        
    }

    override func configure(_ cell: UITableViewCell, at indexPath: IndexPath) {
        if let obj = object(at: indexPath) as? String {
            cell.textLabel?.text = obj
        }
    }

}

