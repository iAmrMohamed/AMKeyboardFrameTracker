//
//  ExampleViewController.swift
//  AMKeyboardFrameTracker_Example
//
//  Created by Amr Mohamed on 1/18/19.
//  Copyright © 2019 Amr Mohamed. All rights reserved.
//

import UIKit
import AMKeyboardFrameTracker

class ExampleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView! {
        didSet {self.tableView.dataSource = self}
    }
    
    @IBOutlet var inputContainerView: UIView!
    @IBOutlet var inputTextView: UITextView!
    @IBOutlet var inputViewBottomConstraint: NSLayoutConstraint!
    
    let keyboardFrameTrackerView = AMKeyboardFrameTrackerView.init(height: 60)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.keyboardDismissMode = .interactive
        
        self.keyboardFrameTrackerView.delegate = self
        self.inputTextView.inputAccessoryView = self.keyboardFrameTrackerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        /* you need to set the inputAccessoryView height if you need
         the keyboard to start dismissing exactly when the touch hits the inputContainerView while panning*/
        self.keyboardFrameTrackerView.setHeight(self.inputContainerView.frame.height)
    }
}

extension ExampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "row: \(indexPath.row)"
        return cell
    }
}

extension ExampleViewController: AMKeyboardFrameTrackerDelegate {
    func keyboardFrameDidChange(with frame: CGRect) {
        let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0.0
        let bottomSapcing = self.view.frame.height - frame.origin.y - tabBarHeight - self.inputContainerView.frame.height
        
        self.inputViewBottomConstraint.constant = bottomSapcing > 0 ? bottomSapcing : 0
        self.view.layoutIfNeeded()
    }
}
