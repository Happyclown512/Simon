//
//  ViewController.swift
//  Simon
//
//  Created by Caden on 9/20/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var RedButton: UIButton!
    @IBOutlet weak var YellowButton: UIButton!
    @IBOutlet weak var BlueButton: UIButton!
    @IBOutlet weak var GreenButton: UIButton!
    var audioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func onRed(_ sender: Any) {
        let sound = Bundle.main.url(forResource: "red", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        audioPlayer.play()
    }
    @IBAction func onGreen(_ sender: Any) {
        let sound = Bundle.main.url(forResource: "green", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        audioPlayer.play()
    }
    @IBAction func onBlue(_ sender: Any) {
        let sound = Bundle.main.url(forResource: "blue", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        audioPlayer.play()
    }
    @IBAction func onYellow(_ sender: Any) {
        let sound = Bundle.main.url(forResource: "yellow", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        audioPlayer.play()
    }
    
}

