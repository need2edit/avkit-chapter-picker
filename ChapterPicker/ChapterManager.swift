//
//  ChapterList.swift
//  ChapterPicker
//
//  Created by Jake Young on 7/13/15.
//  Copyright © 2015 Jake Young. All rights reserved.
//

import Foundation
import AVFoundation
import AVKit

class ChapterManager: NSObject, SimpleDataSourceItem, ChapterSelectionItem {
    
    var delegate: ChapterSelectionDelegate?
    
    typealias T = Chapter
    var items: [T] = []
    
    var numberOfItems: Int {
        return items.count
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func item(indexPath: NSIndexPath) -> T {
        return items[indexPath.row]
    }
    
    func add(chapter: Chapter) {
        items.append(chapter)
    }
    
    func setup(delegate: ChapterSelectionDelegate? = nil) {
        self.delegate = delegate
        for i in 1...12 {
            let chapter = Chapter(title: "Chapter \(i)", time: CMTimeMake(Int64(i * i), 1))
            self.add(chapter)
        }
    }
}


extension ChapterManager: UITableViewDataSource {
    
    // MARK: - Table view data source
    
    @objc func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.numberOfSections
    }
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.numberOfItems
    }
    
    
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(SimpleSubtitleCell.reuseIdentifer, forIndexPath: indexPath) as! SimpleSubtitleCell
        
        cell.detailItem = self.item(indexPath)
        
        return cell
    }
    
}