//
//  SimpleDataSource.swift
//  ChapterPicker
//
//  Created by Jake Young on 7/13/15.
//  Copyright © 2015 Jake Young. All rights reserved.
//

import Foundation

protocol SimpleDataSourceItem {
    
    typealias T
    var items: [T] { get set }
    var numberOfItems: Int { get }
    var numberOfSections: Int { get }
    func item(indexPath: NSIndexPath) -> T
    
}



protocol SimpleDetailItemCell {
    typealias T
    var detailItem: T? { get set }
}

protocol SimpleTextReadable {
    var text: String { get}
}

protocol SimpleDetailTextReadable {
    var detailText: String { get }
}

protocol DisplaysDetailItem {
    func configure()
}

protocol SimpleDetailItem: SimpleTextReadable, SimpleDetailTextReadable {
    
}