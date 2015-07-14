//
//  ChapterSelectionSupported.swift
//  ChapterPicker
//
//  Created by Jake Young on 7/13/15.
//  Copyright © 2015 Jake Young. All rights reserved.
//

import Foundation

protocol ChapterSelectionDelegate {
    func chapterSelected(chapter: Chapter)
}

protocol ChapterSelectionItem {
    var delegate: ChapterSelectionDelegate? { get set }
}