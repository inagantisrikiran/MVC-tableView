//
//  CountryTableViewCell.swift
//  MVC tableView
//
//  Created by SRIKIRAN INAGANTI on 1/16/20.
//  Copyright © 2020 SRIKIRAN INAGANTI. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
