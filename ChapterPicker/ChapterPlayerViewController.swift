//
//  ViewController.swift
//  ChapterPicker
//
//  Created by Jake Young on 7/13/15.
//  Copyright © 2015 Jake Young. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ChapterPlayerViewController: UIViewController, SegueHandlerType, ChapterSelectionDelegate {

    var player: AVPlayer?
    
    enum SegueIdentifier: String {
        case ShowVideo = "Show Video"
        case ShowChapters = "Show Chapters"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier = segueIdentifierForSegue(segue)
        switch identifier {
        case .ShowVideo:
            let videoPlayer = segue.destinationViewController as? AVPlayerViewController
            videoPlayer?.showsPlaybackControls = true
            if let url = NSURL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8") {
                videoPlayer?.player = AVPlayer(URL: url)
                self.player = videoPlayer?.player
            }
        case .ShowChapters:
            let chapterController = segue.destinationViewController as? ChapterSelectorViewController
            chapterController?.delegate = self
        }
    }
    
    func chapterSelected(chapter: Chapter) {
        print(chapter)
        self.navigationItem.title = chapter.title
        self.player?.seekToTime(chapter.time)
        self.player?.play()
    }
    
    override func remoteControlReceivedWithEvent(event: UIEvent?) {
        if let type = event?.subtype {
            switch type {
            case .RemoteControlPause:
                print("pausing...")
            case .RemoteControlPlay:
                print("playing...")
            default:
                print("received remote control event")
            }
        }
    }
    

}

