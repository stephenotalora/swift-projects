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
    var operandStack = Array<Double>()
    var userIsInMiddleOfTypingANumber = false
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(displayView.text!)!.doubleValue
        }
        set{
            displayView.text = "\(newValue)"
            userIsInMiddleOfTypingANumber = false;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /**
     * desc: appends a digit to the end of the string
     * return: none
     */
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInMiddleOfTypingANumber {
            displayView.text = displayView.text! + digit
        } else {
            displayView.text = digit;
            userIsInMiddleOfTypingANumber = true;
        }
    }

    
    @IBAction func enter() {
        userIsInMiddleOfTypingANumber = false;
        operandStack.append(displayValue);
        println("operandStack = \(operandStack)")
    }
    
    /**
     * desc: operates on sender
     * return: none
     */
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "×": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $1 - $0 }
        case "√": performOperation { sqrt($0) }
        default: break;
        }
    }
    
    private func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast());
            enter()
        }
    }
    
    private func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

