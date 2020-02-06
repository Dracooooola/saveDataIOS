//
//  PersistanceRealm.swift
//  SaveData
//
//  Created by Владислав Климов on 30.01.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoItemRealm: Object {
    @objc dynamic var text = ""
}

class PersistanceRealm{
    static let shared = PersistanceRealm()
    
    private let realm = try! Realm()
    
    func save(item: ToDoItemRealm){
        try! realm.write {
            realm.add(item)
        }
    }
    
    func getItems() -> Results<ToDoItemRealm>{
        realm.objects(ToDoItemRealm.self)
    }
    
    func remove(index: Int){
        let item = realm.objects(ToDoItemRealm.self)[index]
        try! realm.write {
            realm.delete(item)
        }
    }
}
