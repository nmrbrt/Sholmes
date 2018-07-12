//
//  AppController.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/12/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import Foundation

class AppController{
    
    init() {
        
        
    }
    
    func initialise(){
        
        self.visualController = VisualController.shared
    }
    
    
    static let shared = AppController()
    
    var visualController = VisualController.shared
}
