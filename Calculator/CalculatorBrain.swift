//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Taylor Mott on 20 Jul 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    private enum Op: Printable {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        
        var description: String {
            get {
                switch self {
                case .Operand(let value):
                    return "\(value)"
                case .UnaryOperation(let symbol, _):
                    return symbol
                case .BinaryOperation(let symbol, _):
                    return symbol
                }
            }
        }
    }
    
    private var opStack = [Op]()
    private var knownOps = [String : Op]()  //dictionary literal
    
    init() {
        func learnOp (op: Op) {
            knownOps[op.description] = op
        }
        
        learnOp(Op.BinaryOperation("÷", {$1 / $0}))
        learnOp(Op.BinaryOperation("×", {$1 * $0}))
        learnOp(Op.BinaryOperation("−", {$1 - $0}))
        learnOp(Op.BinaryOperation("+", {$1 + $0}))
        learnOp(Op.UnaryOperation("√", sqrt))
    }
    
    
    func pushOperand(operand: Double) -> Double? {
        self.opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double? {
        if let operation = knownOps[symbol] {
            self.opStack.append(operation)
        }
        
        return evaluate()
    }
    
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(self.opStack)
        println("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op]) {
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op {
                case .Operand(let operand):
                    return (operand, remainingOps)
                case .UnaryOperation(_, let operation):
                    let operandEvaluation = evaluate(remainingOps)
                    if let operand = operandEvaluation.result {
                        return (operation(operand), operandEvaluation.remainingOps)
                    }
                case .BinaryOperation(_, let operation):
                    let operandEvalution1 = evaluate(remainingOps)
                    if let operand1 = operandEvalution1.result {
                        let operandEvaluation2 = evaluate(operandEvalution1.remainingOps)
                        if let operand2 = operandEvaluation2.result {
                            return (operation(operand1, operand2), operandEvaluation2.remainingOps)
                        }
                    }
            }
        }
        return (nil, ops)
    }
}