//
//  RealmViewController.swift
//  SaveData
//
//  Created by Владислав Климов on 30.01.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var data = PersistanceRealm.shared.getItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(data.count)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.data = PersistanceRealm.shared.getItems()
        self.tableView.reloadData()
        print("Kek \(self.data.count)")
    }
}

extension RealmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealmTableViewCell") as! RealmTableViewCell
        let text = data[indexPath.row].text
        cell.itemText.text = text
        return cell
    }
}

extension RealmViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteItem = UIContextualAction(style: .destructive, title: "Удалить"){
            (contextualAction, view, boolValue) in
                        PersistanceRealm.shared.remove(index: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteItem])
        return swipeActions
    }
}
