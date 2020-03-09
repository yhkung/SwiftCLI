//
//  BasicCalculator.swift
//  Basic
//
//  Created by yhkung on 2020/2/24.
//

import Foundation

enum BasicCalculatorError: Error {
    case invalidArguments
}

struct BasicCalculator {
            
    /// Call this method to get calculated result of input string
    /// - Parameter str: the input string only accepts digits numbers, and  "+", "-", "*", "/" operators
    /// - Example:  "1 + 2 / 3 * 4 - 5"
    func calculate(str: String) throws -> Int {
        guard !str.isEmpty else {
            throw BasicCalculatorError.invalidArguments
        }
        let s = Array(str)
        var sum: Int = 0
                
        /// Previous number
        var num: Int = 0
                
        /// Previous operator
        var op: Character = "+"
        
        var stack: [Int] = []
        
        for i in 0..<s.count {
            let c = s[i]
            if let val = Int("\(c)") {
                num = num * 10  + val
            }
            if i == s.count - 1 || c.isOperator {
                if op == "*" || op == "/" {
                    sum -= stack.last ?? 0
                }
                switch op {
                case "+": stack.append(num)
                case "-": stack.append(-num)
                case "*": stack.append(stack.removeLast() * num)
                case "/": stack.append(stack.removeLast() / num)
                default: break
                }
                op = c
                num = 0
                sum += stack.last ?? 0
            }
        }
        return sum
    }
}

extension Character {
    var isOperator: Bool {
        return self == "+" || self == "-" || self == "*" || self == "/"
    }
}
