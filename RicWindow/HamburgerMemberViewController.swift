//
//  HamburgerMemberViewController.swift
//  RicWindow
//
//  Created by Frederick C. Lee on 5/28/17.
//  Copyright © 2017 Amourine Technologies. All rights reserved.
//

import UIKit

final class HamburgerMemberViewController: UITableViewController {
    
    // MARK: - UITableView DataSource & Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        return cell!
    }
}
