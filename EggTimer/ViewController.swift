//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Created by Leonardo Cardoso on 28/05/2022.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var secondsLabel: UILabel!
    var eggTimes : [String : Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    var counter = 60
    var timer = Timer()
    
//MARK: DidLoad
    override func viewDidLoad() {
        timer.invalidate()
        super.viewDidLoad()
        //        eggTimes["Teste"] = 99999
        //        print(eggTimes)
        //        print(eggTimes.keys)
        //        print(eggTimes.values)
        //        print(eggTimes["Soft"]!)
    }
    
    @objc func updateCounter() {
        if counter > 0 {
            secondsLabel.text = ("\(counter) segundos")
            print("\(counter) seconds")
            counter -= 1
        }
    }
    
//MARK: IBAction
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        counter = eggTimes[hardness]!*60
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
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
