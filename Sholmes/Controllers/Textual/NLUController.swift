//
//  NLUController.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/15/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import Foundation
import NaturalLanguageClassifierV1
import NaturalLanguageUnderstandingV1

class NLUController{
    
    static let shared = NLUController()
    
    private let username = nluUsername
    private let password = nluPassword
    
    private let version = "2018-07-01"
    
    private var naturalLanguageClassifier: NaturalLanguageClassifier
    
    private init(){
        
        self.naturalLanguageClassifier = NaturalLanguageClassifier(username: username, password: password)
    }
    
    
}
