//
//  Calculator.swift
//  Calculator
//
//  Created by Jonathan Otalora  on 2015-09-16.
//  Copyright (c) 2015 Jonathan Otalora. All rights reserved.
//

import Foundation

class Calculator {
    private var result: Double!;
    private var operandStack = Array<Double>()
    var resultValue: Double {
        get {
            return result;
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            result = operation(operandStack.removeLast(), operandStack.removeLast());
        }
    }
    
    func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            result = operation(operandStack.removeLast())
        }
    }
}