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
    
    @IBOutlet weak var resultsTableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let visualRecognition = VisualRecognition(version: "2018-07-01",apiKey: sheli)
        
        self.resultsTableView.delegate = self
        self.resultsTableView.dataSource = self
        let nib = UINib(nibName: "ClassResultTableViewCell", bundle: nil)
        self.resultsTableView.register(nib, forCellReuseIdentifier: "ClassResultTableViewCell")
        
        AppController.shared.visualController.classifySingleImage(image: #imageLiteral(resourceName: "somethingElse.png")) { (classResults) in
            self.classResults.removeAll()
            self.classResults = classResults
            DispatchQueue.main.async {
                self.resultsTableView.reloadData()
            }
        }
        
//        visualRecognition.classify(image: #imageLiteral(resourceName: "somethingElse.png")) { (images) in
//            
//            print(images)
//            
//            guard let classifiers = images.images.first?.classifiers else {return}
//            
//            self.classResults.removeAll()
//            
//            for a in classifiers{
//                
//                for c in a.classes{
//                    
//                    self.classResults.append(c)
//                    print(c.className, c.score ?? 0)
//                }
//            }
//            
//            self.classResults.sort(by: { (a, b) -> Bool in
//                
//                if a.score != nil && b.score != nil{
//                    
//                    return a.score! > b.score!
//                }else{
//                    return false
//                }
//            })
//            
//            DispatchQueue.main.async {
//                self.resultsTableView.reloadData()
//            }
//            
//        }
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

