//
//  MainViewController.swift
//  RicWindow
//
//  Created by Frederick C. Lee on 5/27/17.
//  Copyright © 2017 Amourine Technologies. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var hamburgerWindow:UIWindow?
    var hamburgerContainerViewController:HamburgerContainerViewController?
    
    @IBAction func toggleDisplayOverlay() {
        guard hamburgerWindow != nil else {
            displayOverLay()
            return
        }
        hamburgerWindow = nil
    }
    
    fileprivate func displayOverLay() {
        hamburgerWindow = {() -> UIWindow in
            let cWindow = UIWindow(frame: UIScreen.main.bounds)
            cWindow.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
            cWindow.tag = 100
            return cWindow
        }()
        
        hamburgerWindow?.makeKeyAndVisible()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleHamburgerWindowTap))
        hamburgerWindow?.addGestureRecognizer(tapRecognizer)
        
        let storyboard = UIStoryboard(name: "Hamburger", bundle: nil)
        
        hamburgerContainerViewController = storyboard.instantiateInitialViewController() as? HamburgerContainerViewController
        hamburgerWindow?.rootViewController = hamburgerContainerViewController
    }
    
    internal func handleHamburgerWindowTap() {
        hamburgerContainerViewController?.closeMemberWindow(completion: {
            self.hamburgerWindow = nil
        })
    }
}

