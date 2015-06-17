//
//  AudioViewController.swift
//  SwiftClassP2C7
//
//  Created by apple on 15/6/17.
//  Copyright (c) 2015年 cipnet. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class AudioViewController: UIViewController
{
    var audioPlayer: AVAudioPlayer!
    var timeLabel: UILabel!
    var progress: UISlider!
    var _timer: NSTimer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var btn = UIButton.buttonWithType(.Custom) as! UIButton
        btn.frame = CGRectMake(20, 20, self.view.frame.size.width - 40, 40)
        btn.setTitle("Btn", forState: .Normal)
        btn.backgroundColor = UIColor.grayColor()
        self.view.addSubview(btn)
        btn.addTarget(self, action: "btnClicked:", forControlEvents: .TouchUpInside)
        
        let mp3Path = NSBundle.mainBundle().pathForResource("GameOfThrones", ofType: "mp3")
        let fileUrl = NSURL.fileURLWithPath(mp3Path!)
        audioPlayer = AVAudioPlayer(contentsOfURL: fileUrl, error: nil)
        audioPlayer.prepareToPlay()
        
        timeLabel = UILabel(frame: CGRectMake(20, 80, self.view.frame.size.width - 40, 20))
        timeLabel.backgroundColor = UIColor.grayColor()
        timeLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(timeLabel)
        
        progress = UISlider(frame: CGRectMake(20, 120, self.view.frame.size.width - 40, 20.0))
        self.view.addSubview(progress)
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnClicked(sender: UIButton)
    {
//        self.systemSound()
//        self.systemAlert()
//        self.systemVibration()
        
//        self.audioPlay()
    }
    
    func systemSound()
    {
        var soundID: SystemSoundID = 0
        var path = NSBundle.mainBundle().pathForResource("mono01", ofType: "aiff")
        var baseURL = NSURL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    func systemAlert()
    {
        var soundID: SystemSoundID = 0
        var path = NSBundle.mainBundle().pathForResource("mono01", ofType: "aiff")
        var baseURL = NSURL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        AudioServicesPlayAlertSound(soundID)
    }
    
    func systemVibration()
    {
        var soundID = SystemSoundID(kSystemSoundID_Vibrate)
        AudioServicesPlaySystemSound(soundID)
    }
    
    func audioPlay()
    {
        if (audioPlayer.playing)
        {
            return
        }
        
        audioPlayer.play()
        progress.minimumValue = 0.0
        progress.maximumValue = Float(audioPlayer.duration)
        
        _timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        
    }
    func updateTime()
    {
        var curTime: Float = Float(audioPlayer.currentTime)
        progress.value = curTime
        
        var durTime: Float = Float(audioPlayer.duration)
        
        var hour1: Int = Int(curTime / (60 * 60))
        var min1: Int = Int(curTime / 60)
        var sec1: Int = Int(curTime % 60)
        
        var hour2: Int = Int(durTime / (60 * 60))
        var min2: Int = Int(durTime / 60)
        var sec2: Int = Int(durTime % 60)
        
        timeLabel.text = "\(hour1):\(min1):\(sec1)" + " / " + "\(hour2):\(min2):\(sec2)"
    }
}
