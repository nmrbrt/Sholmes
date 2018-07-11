//
//  ClassResultTableViewCell.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/11/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import UIKit
import VisualRecognitionV3

class ClassResultTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabbel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(with model: ClassResult){
        self.nameLabel.text = model.className
        self.scoreLabbel.text = String(format: "%.3f", model.score ?? 0.0)//"\(model.score ?? 0.0)"
        
    }
    
}
