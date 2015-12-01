//
//  ItemOneViewController.swift
//  SlideOutNavigation
//
//  Created by yww on 11/30/15.
//  Copyright © 2015 James Frost. All rights reserved.
//

import UIKit
import Foundation

class ItemOneViewController: UIViewController {
    var centerDelegate: CenterViewControllerDelegate?
    
    @IBAction func toggleLeft(sender: AnyObject) {
        centerDelegate?.toggleLeftPanel?()
    }
    
    @IBAction func toggleRight(sender: AnyObject) {
        centerDelegate?.toggleRightPanel?()
    }
}
