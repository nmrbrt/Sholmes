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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let visualRecognition = VisualRecognition(version: "2018-07-01",apiKey: sheli)
        
        visualRecognition.classify(image: #imageLiteral(resourceName: "something.png")) { (images) in
            
            print(images)
            
            guard let classifiers = images.images.first?.classifiers else {return}
            
            for a in classifiers{
                
                for c in a.classes{
                    
                    print(c.className, c.score ?? 0)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

