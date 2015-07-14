//
//  ChapterMode.swift
//  ChapterPicker
//
//  Created by Jake Young on 7/13/15.
//  Copyright © 2015 Jake Young. All rights reserved.
//

import Foundation

/**
An enum for how the Chapter Selection Forms it's Captions.

Effectively a user can supply a list of times, or chapters can be automatically formed if the 'AVAsset' has chapter metadata.
*/
enum ChapterParsingMode {
    
    /// User Must Provide a List of Chapters
    case UserProvided
    
    /// Chapters will be automatically created from metadata
    case Automatic
    
}