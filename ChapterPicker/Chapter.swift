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

struct Chapter {
    var title: String
    var time: CMTime
}

extension Chapter: SimpleDetailItem, CustomStringConvertible {
    
    var text: String {
        return self.title
    }
    
    var detailText: String {
        let totalSeconds = CMTimeGetSeconds(self.time)
        let hours = floor(totalSeconds / 3600)
        let minutes = floor(totalSeconds % 3600 / 60)
        let seconds = floor(totalSeconds % 3600 % 60)
        
        return "\(hours):\(minutes):\(seconds)"
    }
    
    var description: String {
        return text
    }
}