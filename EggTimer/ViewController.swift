//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Created by Leonardo Cardoso on 28/05/2022.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
// MARK: Declarando
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var eggTimes : [String : Int] = ["Soft": 3, "Medium": 4, "Hard": 5]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player : AVAudioPlayer!
    let audioFile : String = "alarm_sound"
    
    
//MARK: Funções
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.invalidate()
        progressBar.progress = 0.0
        //        eggTimes["Teste"] = 99999
        //        print(eggTimes)
        //        print(eggTimes.keys)
        //        print(eggTimes.values)
        //        print(eggTimes["Soft"]!)
      
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            titleLabel.text = ("DONE!")
            playSound(soundName: audioFile)
            timer.invalidate()
        }
    }
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        timer.invalidate()
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    func playSound(soundName : String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}










//MARK: Notes
//        if hardness == "Soft" {
//            print(softTime)
//        } else if hardness == "Medium"{
//            print(mediumTime)
//        } else {
//            print(hardTime)
//        }
//
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
