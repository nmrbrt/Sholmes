//
//  SpeechToTextController.swift
//  Sholmes
//
//  Created by Bratt Neumayer on 7/15/18.
//  Copyright © 2018 Bratt Neumayer. All rights reserved.
//

import Foundation
import SpeechToTextV1
import UIKit

class SpeechToTextController{
    
    static let shared = SpeechToTextController()
    
    private let username = sttUsername
    private let password = sttPassword
    
    private let version = "2018-07-01"
    
    private var stt: SpeechToText
    
    let failure = { (error: Error) in print(error) }
    
    var speechRecognitionResults: SpeechRecognitionResults?
    var accumulator = SpeechRecognitionResultsAccumulator()
    
    var textViewDelegate: UITextView?
    
    var stopRec = false
    
    private init(){
        
        self.stt = SpeechToText(username: username, password: password)
    }
    
    
    
    func setTextViewDelegate(to delegate: UITextView){
        
        self.textViewDelegate = delegate
    }
    
    
    
    @objc func start(){
    
        self.stopRec = false
        var settings = RecognitionSettings(contentType: "audio/ogg;codecs=opus")
        settings.interimResults = true
        
        stt.recognizeMicrophone(settings: settings, compress: true, failure: { (error) in
            
            print("recognizeMicrophone","error",error.localizedDescription)
            
        }) { (results) in
            
            if !self.stopRec{
            
                self.accumulator.add(results: results)
                print(self.accumulator.bestTranscript)
                
                self.speechRecognitionResults = results
                
                
                DispatchQueue.main.async {
                    
                    self.textViewDelegate?.text = self.accumulator.bestTranscript
                    
                }
            }
        }
        
        
    }
    
    
    @objc func stop(){
        self.stopRec = true
        stt.stopRecognizeMicrophone()
        self.accumulator.results.removeAll()
    }
    
    
}
