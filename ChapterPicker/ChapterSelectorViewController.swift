//
//  ChapterSelectorViewController.swift
//  ChapterPicker
//
//  Created by Jake Young on 7/13/15.
//  Copyright © 2015 Jake Young. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ChapterSelectorViewController: UITableViewController, ChapterSelectionItem {

    var delegate: ChapterSelectionDelegate? {
        didSet {
            print("Chapter Selection Delegate Set on \(self.dynamicType)")
            self.dataSource.setup(self.delegate)
            self.tableView.reloadData()
        }
    }
    
    var dataSource = ChapterManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.setup(self.delegate)
        self.tableView.dataSource = dataSource
        self.tableView.allowsMultipleSelection = false
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = (tableView.cellForRowAtIndexPath(indexPath) as! SimpleSubtitleCell)
        cell.selected = true
        print(__FUNCTION__)
        self.delegate?.chapterSelected(self.dataSource.item(indexPath))
    }

}
