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
        print("1")
        let visualRecognition = VisualRecognition(version: "2018-07-01",apiKey: sheli)
        
        // Do any additional setup after loading the view, typically from a nib.
        print("2")
//        visualRecognition.
//        visualRecognition.serviceURL = "https://gateway.watsonplatform.net/visual-recognition/api"
        print(visualRecognition.serviceURL)
        
        
        visualRecognition.classify(image: #imageLiteral(resourceName: "something.png")) { (images) in
            
            print(images)
            print("a")
            guard images.images.first?.classifiers != nil else {return}
            print("b")
            for a in images.images.first!.classifiers{
                
                print("c")
                print(a.classifierID, a.name)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

