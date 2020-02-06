//
//  AddItemViewController.swift
//  SaveData
//
//  Created by Владислав Климов on 03.02.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBAction func addButton(_ sender: UIButton) {
        let item = ToDoItemRealm()
        item.text = textView.text
        PersistanceRealm.shared.save(item: item)
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.text = "Введите текст"
        textView.textColor = UIColor.lightGray
    }
}

extension AddItemViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
}
