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
    
    var classifiers: [ClassifierResult]?
    var classResults: [ClassResult] = [ClassResult]()
    
    
    func classifySingleImage(image: UIImage, completion: @escaping (ClassResults) -> Void){
        
//        var classResults = [ClassResult]()
        
        visualRecognition.classify(image: image, failure: ({error in
            
            print(error.localizedDescription)
            completion(self.classResults)
            
        })) { (images) in
            
            self.classifiers = images.images.first?.classifiers
            
            self.extractClassifiers()
            
//            for a in self.classifiers!{
//
//                for c in a.classes{
//
//                    classResults.append(c)
//                    print(c.className, c.score ?? 0)
//                }
//            }
            
            self.sortClassResults()
            
            completion(self.classResults)
        }
    }
    
    
    func extractClassifiers(){
        
        guard self.classifiers != nil else {return}
        
        self.classResults.removeAll()
        
        for a in self.classifiers!{
            
            for c in a.classes{
                
                self.classResults.append(c)
                
                print(c.className, c.score ?? 0)
            }
        }
    }
    
    
    private func sortClassResults(){
        
        self.classResults.sort(by: { (a, b) -> Bool in
            
            if a.score != nil && b.score != nil{
                
                return a.score! > b.score!
            }else{
                return false
            }
        })
    }
    
    
    
    
    
    
    
    
//    private func sort(_ classResults: inout [ClassResult]){
//
//        classResults.sort(by: { (a, b) -> Bool in
//
//            if a.score != nil && b.score != nil{
//
//                return a.score! > b.score!
//            }else{
//                return false
//            }
//        })
//    }
}

