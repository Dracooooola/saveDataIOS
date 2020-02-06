//
//  CoreDataTableViewCell.swift
//  SaveData
//
//  Created by Владислав Климов on 06.02.2020.
//  Copyright © 2020 Владислав Климов. All rights reserved.
//

import UIKit

class CoreDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    
   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
