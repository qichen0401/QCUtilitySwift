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
            configureDataSource()
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
            let key = name(object).sectionTitle()
            if dictionary[key] == nil {
                dictionary[key] = [object]
            } else {
                dictionary[key]?.append(object)
            }
        }
        var ds: [[Any]] = []
        let sectionTitles = UILocalizedIndexedCollation.current().sectionTitles
        for key in sectionTitles {
            if let section = dictionary[key] {
                ds.append(section.sorted() {
                    if name($0).localizedStandardCompare(name($1)) == .orderedAscending {
                        return true
                    } else {
                        return false
                    }
                })
            }
        }
        dataSource = ds
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    open override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return name(dataSource[section].first!).sectionTitle()
    }

    open override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var sectionIndexTitles: [String] = []
        for section in dataSource {
            sectionIndexTitles.append(name(section.first!).sectionTitle())
        }
        return sectionIndexTitles
    }
    
    open override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }

}
