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
    var seq = [Int]()
    var input = [Int]()
    var wrong = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genSeq(rounds: r)
    }
    
    func genSeq(rounds: Int) -> Void {
        var round = 1
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { Timer in
            let c = Int.random(in: 1...4)
            self.sound(c: c)
            self.seq.append(c)
            
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
        input.append(1)
        
        checkInput()
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
        input.append(2)
        
        checkInput()
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
        input.append(3)
        
        checkInput()
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
        input.append(4)
        
        checkInput()
    }
    func playYellow(){
        let sound = Bundle.main.url(forResource: "yellow", withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        
        while !(audioPlayer.isPlaying){
            audioPlayer.play()
        }
    }
    
    func checkInput(){
        let c = seq.count
        if( seq.count == input.count ){
            
            for i in 0...c-1{
                print(seq[i] == input[i])
                if ( seq[i] != input[i] ){
                    let sound = Bundle.main.url(forResource: "lose", withExtension: "wav")
                    audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
                    audioPlayer.play()
                    
                    wrong.append(false)
                    
                } else {
                    wrong.append(true)
                }
            }
            if( !(wrong.contains(false))){
                let sound = Bundle.main.url(forResource: "hiscore", withExtension: "wav")
                audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
                audioPlayer.play()

                r = r + 1
                genSeq(rounds: r)
            }
        }
        
    }
    
}
