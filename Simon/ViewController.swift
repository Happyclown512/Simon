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
    var timer:Timer = Timer()
    var r = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        genSeq(rounds: r)
        
    }
    
    func genSeq(rounds: Int) -> Void{
        var round = 1
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { Timer in
            let c = Int.random(in: 1...4)
            self.sound(c: c)
            
            
            
            if(round >= rounds){
                Timer.invalidate()
            }else{
                round += 1
            }
        })
        
        
        
        
    }
    
     func sound(c: Int) -> Void {
        if( c == 1 ){
            print("red")
            self.playRed()
        }
        else if ( c == 2) {
            print("green")
            self.playGreen()
        }
        else if ( c == 3) {
            print("blue")
            self.playBlue()
        }
        else if ( c == 4) {
        print("yellow")
        self.playYellow()
        }
    }
    

    @IBAction func onRed(_ sender: Any) {
        playRed()
    }
    func playRed(){
        let sound = Bundle.main.url(forResource: "red", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        
        
        while !audioPlayer.isPlaying{
            audioPlayer.play()
        }

    }
    
    
    @IBAction func onGreen(_ sender: Any) {
        playGreen()
    }
    func playGreen(){
        let sound = Bundle.main.url(forResource: "green", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        while !audioPlayer.isPlaying{
            audioPlayer.play()
        }

    }
    
    
    @IBAction func onBlue(_ sender: Any) {
        playBlue()
    }
    func playBlue(){
        let sound = Bundle.main.url(forResource: "blue", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        while !audioPlayer.isPlaying{
            audioPlayer.play()
        }

        
    }
    
    
    @IBAction func onYellow(_ sender: Any) {
        playYellow()
    }
    func playYellow(){
        let sound = Bundle.main.url(forResource: "yellow", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        
        while !(audioPlayer.isPlaying){
            audioPlayer.play()
        }
    }
    
    
}

