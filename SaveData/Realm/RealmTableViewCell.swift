//
//  RealmTableViewCell.swift
//  SaveData
//
//  Created by Владислав Климов on 30.01.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import UIKit

class RealmTableViewCell: UITableViewCell {

    @IBOutlet weak var itemText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
