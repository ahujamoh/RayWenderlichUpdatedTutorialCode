//
//  ContainerViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case BothCollapsed
    case LeftPanelExpand
    case RightPanelExpand
}

class ContainerViewController: UIViewController {
  
    var centerNavigationController: UINavigationController!
    var centerViewController: CenterViewController!
    var customTabbarController: CustomTabBarController!
    
    var currentState: SlideOutState = .BothCollapsed
    var leftViewController: SidePanelViewController?
    
    let centerPanelExpandedOffset: CGFloat = 60
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    centerViewController = UIStoryboard.centerViewController()
//    centerViewController.delegate = self
//    
//    centerNavigationController = UINavigationController(rootViewController: centerViewController)
//    view.addSubview(centerNavigationController.view)
//    addChildViewController(centerNavigationController)
//    
//    centerNavigationController.didMoveToParentViewController(self)
    
    customTabbarController = UIStoryboard.tabbarViewController()
    (customTabbarController.childViewControllers[0].childViewControllers[0] as! ItemOneViewController).centerDelegate = self
    view.addSubview(customTabbarController.view)
    
    addChildViewController(customTabbarController)
    customTabbarController.didMoveToParentViewController(self)
  }
  
}

// MARK: - ContainerViewController extension
extension ContainerViewController: CenterViewControllerDelegate {
// MARK: - CenterViewController delegate
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .LeftPanelExpand)
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        
        animateLeftPanel(notAlreadyExpanded)
    }
    
    func toggleRightPanel() {
        
    }
    
    func addLeftPanelViewController() {
        if leftViewController == nil {
            leftViewController = UIStoryboard.leftViewController()
            leftViewController!.animals = Animal.allCats()
            addChildSidePanelController(leftViewController!)
        }
    }
    
    func addChildSidePanelController(sidePanelController: SidePanelViewController) {
        view.insertSubview(sidePanelController.view, atIndex: 0)
        
        addChildViewController(sidePanelController)
        sidePanelController.didMoveToParentViewController(self)
    }
    
    func addRightPanelViewController() {
        
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
            currentState = .LeftPanelExpand
            
//            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset )
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(customTabbarController.view.frame) - centerPanelExpandedOffset )
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .BothCollapsed
                
                self.leftViewController!.view.removeFromSuperview()
                self.leftViewController = nil
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
//                self.centerNavigationController.view.frame.origin.x = targetPosition
            self.customTabbarController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
    
    func animateRightPanel(shouldExpand: Bool) {
        
    }
}

private extension UIStoryboard {
  class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
  
  class func leftViewController() -> SidePanelViewController? {
    return mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? SidePanelViewController
  }
  
  class func rightViewController() -> SidePanelViewController? {
    return mainStoryboard().instantiateViewControllerWithIdentifier("RightViewController") as? SidePanelViewController
  }
  
  class func centerViewController() -> CenterViewController? {
    return mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController
  }
    
    class func tabbarViewController() -> CustomTabBarController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("TabBarViewController") as?CustomTabBarController
    }
  
}