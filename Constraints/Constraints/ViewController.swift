//
//  ViewController.swift
//  Constraints
//
//  Created by yww on 10/15/15.
//  Copyright © 2015 Netease. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: UIButton) {
        if sender.titleForState(.Normal) == "X" {
            sender.setTitle("A very long title for this button", forState: .Normal)
        } else {
            sender.setTitle("X", forState: .Normal)
        }
    }

}

