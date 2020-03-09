import Foundation
import ArgumentParser

struct CalculateCommand: ParsableCommand {
    @Option(
        name: .shortAndLong,
        default: nil,
        help: "The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero."
    )
    var input: String
    
    func run() throws {
        do {
            let calculator = BasicCalculator()
            let result = try calculator.calculate(str: input)
            print("Caculate string '\(input)' = \(result)")
        } catch BasicCalculatorError.invalidArguments {
            print("Invalid arguments")
        }
    }
    
}

CalculateCommand.main()
