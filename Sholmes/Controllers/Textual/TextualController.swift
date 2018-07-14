//
//  TextualController.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/13/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import Foundation
import ToneAnalyzerV3

class TextualController{
    
    static let shared = TextualController()
    
    // .username and .password are saved in an ignored file.
    // You have to create those by yourself in the IBM cloud.
    private let username = toneUsername
    private let password = tonePassword
    
    private let version = "2018-07-01"
    
    private var toneAnalyzer: ToneAnalyzer
    
    var currentDocumentTone: DocumentAnalysis?
    var currentSentencesTone: [SentenceAnalysis]?
    
    
    private init() {
        
        toneAnalyzer = ToneAnalyzer(username: username, password: password, version: version)
    }
    
    
    
    func analyzeTone(){
        
        let text = "Please please lets do something together. I really want to do something really really cool yo!"

        let toneContent = ToneContent.text(text)
        
        toneAnalyzer.tone(toneContent: toneContent) { (toneAnalysis) in
        
            self.currentDocumentTone = toneAnalysis.documentTone
            self.currentSentencesTone = toneAnalysis.sentencesTone
            
            self.output()
        }
        
    }
    
    
    
    func output(){
        
        if let tones = self.currentDocumentTone?.tones{
            
            for tone in tones{
                
                print(tone.toneName, tone.score)
            }
        }
    }
}
