//
//  ViewController.swift
//  QCUtilitySwift
//
//  Created by Qi Chen on 12/01/2016.
//  Copyright (c) 2016 Qi Chen. All rights reserved.
//

import UIKit
import QCUtilitySwift

class ViewController: CoreDataTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        supportDelete = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

