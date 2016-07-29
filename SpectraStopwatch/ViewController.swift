//
//  ViewController.swift
//  SpectraStopwatch
//
//  Created by Scotty Shaw on 7/23/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter: Int = 0
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func startTime(sender: AnyObject) {
        alternateButtons()
        validateTimer()
    }
    
    @IBAction func stopTime(sender: AnyObject) {
        alternateButtons()
        timer.invalidate()
        counter = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopButton.hidden = true
        stopButton.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateTimer() {
        let repeatingFunction: Selector = #selector(ViewController.updateTime)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: repeatingFunction, userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        counter += 1
        myLabel.text = "\(counter)"
    }
    
    func alternateButtons() {
        startButton.hidden = !startButton.hidden
        startButton.enabled = !startButton.enabled
        stopButton.hidden = !stopButton.hidden
        stopButton.enabled = !stopButton.enabled
    }
    
}

