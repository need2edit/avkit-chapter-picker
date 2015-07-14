//
//  SimpleDataSource.swift
//  ChapterPicker
//
//  Created by Jake Young on 7/13/15.
//  Copyright © 2015 Jake Young. All rights reserved.
//

import Foundation

/// Simple object thats supports a list of items, a single section, and can fetch an item
protocol SimpleDataSourceItem {
    
    /// The Type of object or protocol this `SimpleDataSourceItem` works with
    typealias T
    
    /// A collection of generic items
    var items: [T] { get set }
    
    /// The number of generic items in this `SimpleDataSourceItem`
    var numberOfItems: Int { get }
    var numberOfSections: Int { get }
    
    /// Get an item at a given index
    func item(index: Int) -> T
    
    /// Get an item at a given NSIndexPath
    func item(indexPath: NSIndexPath) -> T
    
}

/// A Cell that Supports Setting a Detail Item
protocol SimpleDetailItemCell {
    typealias T
    var detailItem: T? { get set }
}

/// Displays a string for easy coupling to UITextViewCells and similar
protocol SimpleTextReadable {
    var text: String { get}
}

/// Displays a string for easy coupling to UITextViewCells and similar
protocol SimpleDetailTextReadable {
    var detailText: String { get }
}

/// Configures a Cell's View with Information from the Detail Item
protocol DisplaysDetailItem: SimpleDetailItemCell {
    func configure()
}

/// Composite Protocol for Text and Detail Text displays, works well with UITextViewCells
protocol SimpleDetailItem: SimpleTextReadable, SimpleDetailTextReadable {
    
}