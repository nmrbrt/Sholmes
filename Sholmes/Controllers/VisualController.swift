//
//  VisualController.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/12/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import Foundation
import VisualRecognitionV3

typealias ClassResults = [ClassResult]

class VisualController{
    
    init() {
        
        visualRecognition = VisualRecognition(version: "2018-07-01",apiKey: sheli)
    }
    
    
    static let shared = VisualController()
    
    var visualRecognition: VisualRecognition!
    
    
    func classifySingleImage(image: UIImage, completion: @escaping (ClassResults) -> Void){
        
        var classResults = [ClassResult]()
        
//        visualRecognition.classify(image: #imageLiteral(resourceName: "somethingElse.png")) { (images) in
//            
//            print(images)
//        
//            
//            guard let classifiers = images.images.first?.classifiers else {return}
//            
//            for a in classifiers{
//                
//                for c in a.classes{
//                    
//                    classResults.append(c)
//                    print(c.className, c.score ?? 0)
//                }
//            }
//            
//            self.sort(&classResults)
//            
//            completion(classResults)
//        }
        
        visualRecognition.classify(image: image,failure: ({error in
            
            print(error.localizedDescription)
            completion(classResults)
            
        })) { (images) in
            
            print(images)
            
            guard let classifiers = images.images.first?.classifiers else {return}
            
            for a in classifiers{
                
                for c in a.classes{
                    
                    classResults.append(c)
                    print(c.className, c.score ?? 0)
                }
            }
            
            self.sort(&classResults)
            
            completion(classResults)
        }
    }
    
    
    private func sort(_ classResults: inout [ClassResult]){
        
        classResults.sort(by: { (a, b) -> Bool in
            
            if a.score != nil && b.score != nil{
                
                return a.score! > b.score!
            }else{
                return false
            }
        })
    }
}

