//
//  ViewController.swift
//  SaveData
//
//  Created by Владислав Климов on 30.01.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    
    @IBAction func saveButton(_ sender: UIButton) {
        if  let name = nameTextField.text, name != "",
            let surname = surnameTextField.text, surname != "" {
            PersistanceUserDefaults.shared.userName = name
            PersistanceUserDefaults.shared.userSurname = surname
            textLabel.text = name + " " + surname
        } else {
            textLabel.text = "Вы не ввели данные, повторите ввод"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = PersistanceUserDefaults.shared.userName, let surname = PersistanceUserDefaults.shared.userSurname {
            textLabel.text = name + " " + surname
        }
    }


}

