//
//  HeaderTableViewCell.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/15/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var headerTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
