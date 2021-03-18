//
//  TopicsViewController.swift
//  mockNoteApp
//
//  Created by Mathew  Henderson on 2/25/21.
//  Copyright © 2021 Mathew  Henderson. All rights reserved.
//

import UIKit

// connect the labels in viewController to Swift code for manipulation. ! check nil
class TopicsViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    // property to display
    var topic: Topics!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = topic.name
        numberLabel.text = String(format: "#%03d", topic.number)
    }
}

