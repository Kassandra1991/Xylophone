//
//  ViewController.swift
//  Xylophone
//
//  Created by Aleksandra Asichka on 2023-01-25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBAction func keyPressed(_ sender: UIButton) {
        guard let keyTitle = sender.titleLabel?.text else {
            return
        }
        playSound(sound: keyTitle)
        changedAlpha(button: sender)
    }
    
    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "wav")
        guard let url = url else {
            return
        }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
    
    func changedAlpha(button: UIButton) {
        button.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            button.alpha = 1
        }
    }
}

