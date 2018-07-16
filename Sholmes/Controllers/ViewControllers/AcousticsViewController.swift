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
    @IBOutlet weak var textView: UITextView!
    
    
    var speechToTextController = AppController.shared.speechToTextController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.prepareButtons()
        self.speechToTextController.setTextViewDelegate(to: self.textView)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.stopButton.isEnabled = false
        self.startButton.isEnabled = true
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func didTapClearItem(_ sender: Any) {
        
        self.speechToTextController.stop()
        self.textView.text = ""
    }
    
    
    
    
    func prepareButtons(){
        
        self.startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        self.stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
    }
    
    
    
    @objc func start(){
        
        self.speechToTextController.start()
        self.stopButton.isEnabled = true
        self.startButton.isEnabled = false
    }

    
    @objc func stop(){
        
        self.speechToTextController.stop()
        self.startButton.isEnabled = true
        self.stopButton.isEnabled = false
    }
}
