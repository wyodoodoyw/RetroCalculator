//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Matthew Wood on 2016-10-19.
//  Copyright © 2016 Matthew. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var buttonSound: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a path for btn.wav
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav") // returns String
        let soundURL = URL(fileURLWithPath: path!) // convert String to URL
        
        do {
            try buttonSound = AVAudioPlayer(contentsOf: soundURL)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
    }
    
    func playSound() {
        if buttonSound.isPlaying {
            buttonSound.stop()
        }
        buttonSound.play()
    }

}

