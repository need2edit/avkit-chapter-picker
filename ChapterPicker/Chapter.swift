//
//  Chapter.swift
//  ChapterPicker
//
//  Created by Jake Young on 7/13/15.
//  Copyright © 2015 Jake Young. All rights reserved.
//

import Foundation
import AVKit
import AVFoundation

/// A data structure with title and a time
struct Chapter {
    
    var title: String
    var time: CMTime
    
}


extension Chapter: SimpleDetailItem, CustomStringConvertible {
    
    /// The simple text output of a chapter
    var text: String {
        return self.title
    }
    
    /// The simple detail text output of a chapter
    var detailText: String {
        let totalSeconds = CMTimeGetSeconds(self.time)
        let hours = floor(totalSeconds / 3600)
        let minutes = floor(totalSeconds % 3600 / 60)
        let seconds = floor(totalSeconds % 3600 % 60)
        
        return "\(hours):\(minutes):\(seconds)"
    }
    
    /// Conform to CustomStringConvertible
    var description: String {
        return text
    }
}