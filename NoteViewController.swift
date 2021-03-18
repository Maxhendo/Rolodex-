//
//  NoteViewController.swift
//  mockNoteApp
//
//  Created by Mathew  Henderson on 2/25/21.
//  Copyright © 2021 Mathew  Henderson. All rights reserved.
//

import UIKit

class NoteViewController: UITableViewController {
    var notes: [Note] = []
    
    @IBAction func createNote() {
        let _ = NoteManager.main.create()
        reload()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }

    
    // display sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // display rows in section. number is the amount of elements in field using count property
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    // display cell in "Identifier", using indexPath. take a cell's text and fill in element's object's name
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].contents
        return cell
    }
    
    func reload() {
        notes = NoteManager.main.getAllNotes()
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditSegue" {
            if let destination = segue.destination as? EditViewController {
                destination.note = notes[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
}

