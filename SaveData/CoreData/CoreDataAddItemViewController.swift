//
//  CoreDataAddItemViewController.swift
//  SaveData
//
//  Created by Владислав Климов on 06.02.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import UIKit
import CoreData

class CoreDataAddItemViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func addItem(_ sender: UIButton) {
        let text = textView.text
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ToDoItem", in: managedContext)!
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        item.setValue(text, forKey: "text")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Don't save \(error), \(error.userInfo)")
        }
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.text = "Введите текст"
        textView.textColor = UIColor.lightGray
    }
}

extension CoreDataAddItemViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
}

