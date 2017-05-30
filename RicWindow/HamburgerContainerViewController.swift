//
//  HamburgerContainerViewController.swift
//  RicWindow
//
//  Created by Frederick C. Lee on 5/27/17.
//  Copyright © 2017 Amourine Technologies. All rights reserved.
//

import UIKit

final class HamburgerContainerViewController: UIViewController {
    
    var memberViewController: HamburgerMemberViewController?
    
    // MARK: - UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Hamburger", bundle: nil)
        memberViewController = storyboard.instantiateViewController(withIdentifier: "MemberVC") as? HamburgerMemberViewController
    }
    
    override func viewDidLayoutSubviews() {
        guard let memberVC = memberViewController else {
            return
        }
        
        // 1) Add Child ViewController:
        addChildViewController(memberVC)
        
        // 2) Add Child VC's view to Container View:
        self.view.addSubview(memberVC.view)
        memberVC.view.tag = 200
        memberVC.view.frame = CGRect(x: 0, y: 0, width: 0, height: UIScreen.main.bounds.size.height)
        
        UIView.animate(withDuration: 1.0, animations: {
            memberVC.view.frame.size.width = 200.0
        })
        
        // 3) Notify Child VC that it had moved to container VC:
        memberVC.didMove(toParentViewController: self)
    }
    
    // MARK: - Action Methods
    
    internal func closeMemberWindow(completion: @escaping ()->Void) {
        guard let memberVC = memberViewController  else {
            return
        }
        UIView.animate(withDuration: 1.0, animations: {
            memberVC.view.frame.size.width = 0.0
        }) { (success) in
            memberVC.removeFromParentViewController()
            completion()
        }
    }
}
