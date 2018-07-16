//
//  TextualViewController.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/14/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import UIKit
import ToneAnalyzerV3

class TextualViewController: UIViewController {

    @IBOutlet weak var textualTableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    var textualController = AppController.shared.textualController
    
    var toneScores = [ToneScore]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.prepareScene()
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    
    func prepareScene(){
        
        self.textualTableView.delegate = self
        self.textualTableView.dataSource = self
        
        let scoreNib = UINib(nibName: "ScoreTableViewCell", bundle: nil)
        let headerNib = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        
        self.textualTableView.register(scoreNib, forCellReuseIdentifier: "ScoreTableViewCell")
        self.textualTableView.register(headerNib, forCellReuseIdentifier: "HeaderTableViewCell")
        
        self.addTapRecognizer()
        
        self.textView.delegate = self
    }
    
    
    
    @IBAction func didTapGoItem(_ sender: Any) {
        
        self.startRecognition()
        self.hideKeyboard()
    }
    
    
    
    @objc func startRecognition(){
        
        self.textualController.setText(to: self.textView.text)
        
        self.textualController.analyzeTone {
            
            self.toneScores = self.textualController.getTonesScores()
            
            DispatchQueue.main.async {
                
                self.textualTableView.reloadData()
            }
            
        }
    }
    


    func addTapRecognizer(){

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        self.textualTableView.addGestureRecognizer(tapRecognizer)
    }
    
    
    
    @objc func hideKeyboard(){
        
        self.view.endEditing(true)
    }

}



extension TextualViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.toneScores.count > 0{
        
            return self.toneScores.count + 1
            
        }else{
            
            return 0
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let tempCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
            
            tempCell.headerTextLabel.text = "Tone Analysis"
            tempCell.separatorInset = UIEdgeInsetsMake(0.0, tempCell.bounds.size.width, 0.0, 0.0);
            
            return tempCell
            
        default:
            
            let tempCell = tableView.dequeueReusableCell(withIdentifier: "ScoreTableViewCell", for: indexPath) as! ScoreTableViewCell
            tempCell.bind(withModel: self.toneScores[indexPath.row - 1].scoreModel)
            
            return tempCell
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
}



extension TextualViewController: UITextViewDelegate{
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if(text == "\n") {
            
//            self.startRecognition()
//            textView.resignFirstResponder()
            self.didTapGoItem(textView)
            
            return false
        }
        
        return true
    }
}
