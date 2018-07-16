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
    
    private var textForToneAnalyzer = ""
    
    
    private init() {
        
        toneAnalyzer = ToneAnalyzer(username: username, password: password, version: version)
    }
    
    
    
    func setText(to text: String){
        
        self.textForToneAnalyzer = text
    }
    
    
    
    func analyzeTone(completion: @escaping () -> Void){
        
        let toneContent = ToneContent.text(self.textForToneAnalyzer)
        
        toneAnalyzer.tone(toneContent: toneContent) { (toneAnalysis) in
        
            self.currentDocumentTone = toneAnalysis.documentTone
            self.currentSentencesTone = toneAnalysis.sentencesTone
            
            self.output()
            completion()
        }
        
    }
    
    
    func getTonesScores() -> [ToneScore]{
        
        return self.currentDocumentTone?.tones ?? [ToneScore]()
    }
    
    
    func getSentencesAnalysis() -> [SentenceAnalysis]{
        
        return self.currentSentencesTone ?? [SentenceAnalysis]()
    }
    
    
    func output(){
        
        if let tones = self.currentDocumentTone?.tones{
            
            for tone in tones{
                
                print(tone.toneName, tone.score)
            }
        }
    }
}



extension ToneScore{
    
//    func scoreModel() -> ScoreModel{
//
//        return ScoreModel(title: self.toneName, value: String(format: "%.3f", self.score) )
//    }
    
    
    var scoreModel: ScoreModel{
        
        get{
            return ScoreModel(title: self.toneName, value: String(format: "%.3f", self.score) )
        }
    }
}
