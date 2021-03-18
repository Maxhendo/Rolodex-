//
//  ViewController.swift
//  mockNoteApp
//
//  Created by Mathew  Henderson on 2/25/21.
//  Copyright © 2021 Mathew  Henderson. All rights reserved.
//

import UIKit

// field created
class ViewController: UITableViewController {
    let topics = [
        Topics(name: "Groceries", number: 1),
        Topics(name: "Chores", number: 2),
        Topics(name: "Leisure", number: 3),
        Topics(name: "Ideas", number: 4)
    ]
    
    // display sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // display rows in section. number is the amount of elements in field using count property
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    // display cell in "Identifier", using indexPath. take a cell's text and fill in element's object's name
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicsCell", for: indexPath)
        cell.textLabel?.text = topics[indexPath.row].name
        return cell
    }
    
    // method. if the segue is to TVC then destination get passed selected row from Topics. ! check nil
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TopicsSegue" {
            if let destination = segue.destination as? TopicsViewController {
                destination.topic = topics[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
}

