//
//  ViewController.swift
//  SRMiPhonePracticeTimer
//
//  Created by mhjkc on 21/8/14.
//  Copyright (c) 2014 mhykol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startStopButton: UIButton!
    @IBOutlet var hour: UILabel!
    @IBOutlet var minute: UILabel!
    @IBOutlet var second: UILabel!
    
    var isCounting: Bool = false
    var timer: NSTimer!
    var s = 0
    var m = 0
    var h = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController.navigationBarHidden = true
    }

    @IBAction func startStopCount(_: AnyObject) {
        
        print(isCounting);
        if (self.isCounting) {
            self.startStopButton.setTitle("START", forState: UIControlState.Normal)
            timer.invalidate()
            
            let timeDetailsViewController = self.storyboard.instantiateViewControllerWithIdentifier("TimeDetailsViewController") as TimeDetailsViewController
            timeDetailsViewController.duration = NSString(format:"%.2d : %.2d : %.2d", h, m, s)
            // timeDetailsViewController.viewOnly = true;
            self.navigationController.pushViewController(timeDetailsViewController, animated: true)
            
            h = 0
            m = 0
            s = 0
            hour.text = NSString(format:"%.2d", h);
            minute.text = NSString(format:"%.2d", m);
            second.text = NSString(format:"%.2d", s);
        } else {
            self.startStopButton.setTitle("STOP", forState: UIControlState.Normal)
            timer = NSTimer.scheduledTimerWithTimeInterval(0.000001, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
            
            
        }
        
        isCounting = !isCounting;
        println(" " + self.startStopButton.titleLabel.text)
        
    }
    
    func updateTimer() {
        dispatch_async(dispatch_get_main_queue()) {
            self.s++;
            if (self.s > 0 && self.s%60 == 0) {
                self.s = 0;
                self.m++;
                if (self.m > 0 && self.m%60 == 0) {
                    self.m = 0;
                    self.h++
                    if (self.h > 0 && self.h%100 == 0) {
                        self.h = 0;
                    }
                    self.hour.text = NSString(format:"%.2d", self.h);
                }
                self.minute.text = NSString(format:"%.2d", self.m);
            }
            self.second.text = NSString(format:"%.2d", self.s);
        }
    }
    
}

