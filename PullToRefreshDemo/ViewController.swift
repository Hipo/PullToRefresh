//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Anastasiya Gorban on 5/19/15.
//  Copyright (c) 2015 Yalantis. All rights reserved.
//

import PullToRefresh
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet
    private var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.addPullToRefresh(PullToRefresh()) {
            [weak self] in
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                self?.tableView.endRefreshing()
            })
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        tableView.removePullToRefresh(tableView.pullToRefresh!)
    }
    
    @IBAction
    private func startRefreshing() {
        tableView.startRefreshing()
    }
}

