//
//  ViewController.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/10/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import UIKit
import VisualRecognitionV3


class ViewController: UIViewController {
    
    var classResults = [ClassResult]()
    var visualController = AppController.shared.visualController
    
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageContainerView: UIView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.prepareScene()
        
        self.startClassification()
    }
    
    
    
    private func prepareScene(){
        
        self.resultsTableView.delegate = self
        self.resultsTableView.dataSource = self
        
        let nib = UINib(nibName: "ClassResultTableViewCell", bundle: nil)
        self.resultsTableView.register(nib, forCellReuseIdentifier: "ClassResultTableViewCell")
    }
    
    
    
    func startClassification(){
        
        self.visualController.classify(image: #imageLiteral(resourceName: "somethingElse.png")) { (classResults) in
            
            self.classResults = classResults
            
            DispatchQueue.main.async {
                
                self.resultsTableView.reloadData()
            }
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.classResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "ClassResultTableViewCell", for: indexPath) as! ClassResultTableViewCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! ClassResultTableViewCell).bind(with: self.classResults[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

