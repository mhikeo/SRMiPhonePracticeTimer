//
//  TimeDetailsViewController.swift
//  SRMiPhonePracticeTimer
//
//  Created by mhjkc on 21/8/14.
//  Copyright (c) 2014 mhykol. All rights reserved.
//

import Foundation
import UIKit

class TimeDetailsViewController: UIViewController {
    
    var duration: NSString!
    var viewOnly: Bool!
    
    @IBOutlet var lblDuration: UILabel!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtDivision: UITextField!
    @IBOutlet var txtLanguage: UITextField!
    @IBOutlet var btnSave: UIButton!
    @IBOutlet var btnCancel: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if ((viewOnly) != nil) {
            txtName.enabled = false
            txtDivision.enabled = false
            txtLanguage.enabled = false
            btnSave.hidden = true
            btnCancel.hidden = true
            self.navigationController.navigationBarHidden = false
        } else {
            lblDuration.text = duration
        }
    }
    
    @IBAction func save(_: AnyObject) {
        
    }
    
    @IBAction func cancel(_: AnyObject) {
        self.navigationController.popViewControllerAnimated(true)
    }

}
