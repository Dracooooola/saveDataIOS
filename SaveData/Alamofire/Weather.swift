//
//  Weather.swift
//  ClientServerStart
//
//  Created by Владислав Климов on 23.01.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import Foundation
import RealmSwift

class Weather {
    var city: String = "Москва"
    let temp: Double
    
    var date: Date? = nil
    var overcast: String = "..."
    
    init(temp: Double, date: Date, overcast: String ) {
        self.temp = temp
        self.date = date
        self.overcast = overcast
    }
}
