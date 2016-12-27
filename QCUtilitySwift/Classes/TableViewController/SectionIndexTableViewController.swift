//
//  SectionIndexTableViewController.swift
//  Pods
//
//  Created by Qi Chen on 12/27/16.
//
//

import UIKit

open class SectionIndexTableViewController: BaseTableViewController {

    open var rawData: [Any]! {
        didSet {
            
        }
    }
    
    open var name = { (obj: Any) -> String in
        if let s = obj as? String {
            return s
        }
        return ""
    }
    
    open func configureDataSource() {
        var dictionary: [String : [Any]] = [:]
        for object in rawData {
            let key = name(object)
        }
        
        
        
        
        
        
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}

extension String {
    func sectionTitle() -> String {
        let sectionTitles = UILocalizedIndexedCollation.current().sectionTitles
        if self.isEmpty {
            return sectionTitles.last!
        }
        let pinYinString = self.pinYin()
        let firstCharacter = pinYinString.substring(to: pinYinString.index(after: pinYinString.startIndex)).uppercased()
        if sectionTitles.contains(firstCharacter) {
            return firstCharacter
        } else {
            return sectionTitles.last!
        }
    }
}
