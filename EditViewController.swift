//
//  EditViewController.swift
//  mockNoteApp
//
//  Created by Mathew  Henderson on 3/17/21.
//  Copyright © 2021 Mathew  Henderson. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    var note: Note!
    
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = note.contents
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        note.contents = textView.text
        NoteManager.main.save(note: note)
    }
}
