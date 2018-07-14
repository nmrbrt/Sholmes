//
//  AcousticsViewController.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/14/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import UIKit

class AcousticsViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var textualController = AppController.shared.textualController
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.prepareButtons()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func prepareButtons(){
        
        self.startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        self.stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
    }
    
    
    
    @objc func start(){
        
        self.textualController.analyzeTone()
    }

    
    @objc func stop(){
        
        
    }
}
