//
//  PersistanceUserDefaults.swift
//  SaveData
//
//  Created by Владислав Климов on 30.01.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import Foundation

class PersistanceUserDefaults{
    static let shared = PersistanceUserDefaults()
    
    private let userNameKey = "PersistanceUserDefaults.userNameKey"
    private let userSurnameKey = "PersistanceUserDefaults.userSurnameKey"
    
    var userName: String? {
        set { UserDefaults.standard.set(newValue, forKey: userNameKey) }
        get { UserDefaults.standard.string(forKey: userNameKey) }
    }
    
    var userSurname: String? {
        set { UserDefaults.standard.set(newValue, forKey: userSurnameKey) }
        get { UserDefaults.standard.string(forKey: userSurnameKey) }
    }
}
