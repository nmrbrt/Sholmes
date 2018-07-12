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
    
    
    static let shared = VisualController()
    
    var visualRecognition: VisualRecognition!
    
    var classifiers: [ClassifierResult]?
    
    var classResults: [ClassResult] = [ClassResult]()
    
    
    
    init() {
        
        visualRecognition = VisualRecognition(version: "2018-07-01",apiKey: sheli)
    }
    
    
    //Make sure this completes before reuse
    func classifySingleImage(image: UIImage, completion: @escaping (ClassResults) -> Void){
        
        visualRecognition.classify(image: image, failure: ({error in
            
            print(error.localizedDescription)
            completion(self.classResults)
            
        })) { (images) in
            
            self.classifiers = images.images.first?.classifiers
            
            self.extractClassifiers()
            
            self.sortClassResults()
            
            completion(self.classResults)
        }
    }
    
    
    
    // Limited to the first set of classifiert - for now we classify a single image
    func extractClassifiers(){
        
        guard self.classifiers != nil else {return}
        
        guard let firstClassifierResult = self.classifiers?.first else {return}
        
        self.classResults = firstClassifierResult.classes
    }
    
    
    
    private func sortClassResults(){
        
        self.classResults.sort(by: {$0.score! > $1.score!})
        
        //If you want to make it more exception-safe
//        self.classResults.sort(by: { (a, b) -> Bool in
//
//            if a.score != nil && b.score != nil{
//
//                return a.score! > b.score!
//
//            }else{
//
//                return false
//            }
//        })
    }
}

