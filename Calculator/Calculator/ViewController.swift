//
//  ViewController.swift
//  Calculator
//
//  Created by Jonathan Otalora  on 2015-09-13.
//  Copyright (c) 2015 Jonathan Otalora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // instance variables
    @IBOutlet weak var displayView: UILabel!
    var userIsInMiddleOfTypingANumber: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInMiddleOfTypingANumber {
            displayView.text = displayView.text! + digit
        } else {
            displayView.text = digit;
            userIsInMiddleOfTypingANumber = true;
        }
    }

    
    @IBAction func enter(sender: AnyObject) {
        println(sender.currentTitle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

