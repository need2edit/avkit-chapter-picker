//
//  SimpleSubtitleCell.swift
//  ChapterPicker
//
//  Created by Jake Young on 7/13/15.
//  Copyright © 2015 Jake Young. All rights reserved.
//

import UIKit

protocol Reusable {
    static var reuseIdentifer: String { get }
}

class SimpleSubtitleCell: UITableViewCell, Reusable, SimpleDetailItemCell, DisplaysDetailItem {

    typealias T = Chapter
    
    var detailItem: Chapter? {
        didSet {
            configure()
        }
    }
    
    func configure() {
        if let detail = detailItem {
            self.textLabel?.text = detail.text
            self.detailTextLabel?.text = detail.detailText
        }
    }
    
    static var reuseIdentifer: String {
        return "SimpleSubtitleCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        let label = UILabel()
        label.text = "Playing..."
        label.sizeToFit()
        //selected ? (self.accessoryType = .Checkmark) : (self.accessoryType = .None)
        selected ? (self.accessoryView = label) : (self.accessoryView = nil)
        super.setSelected(selected, animated: animated)
        
    }

}
