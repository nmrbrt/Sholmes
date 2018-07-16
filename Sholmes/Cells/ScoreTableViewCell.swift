//
//  ScoreTableViewCell.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/14/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import UIKit

struct ScoreModel{
    var title, value: String
}

class ScoreTableViewCell: UITableViewCell {
    
    @IBOutlet weak var scoreTitleLabel: UILabel!
    @IBOutlet weak var scoreValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
    
    
    
    func bind(withModel model: ScoreModel){
        
        DispatchQueue.main.async {
            
            self.scoreTitleLabel.text = model.title
            self.scoreValueLabel.text = model.value
        }
    }
    
}
