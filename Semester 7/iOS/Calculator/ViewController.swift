import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Result: UILabel!
    var currentInput: String = ""

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }

        switch buttonTitle {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
            // Append number to current input
            currentInput += buttonTitle
            updateDisplay(currentInput)
        
        case "+", "-", "*", "/":
            // Check for consecutive operators
            if !currentInput.isEmpty, !isLastCharacterOperator() {
                currentInput += " " + buttonTitle + " "
                updateDisplay(currentInput)
            }

        case "+/-":
            if let currentValue = Double(currentInput.trimmingCharacters(in: .whitespaces)) {
                currentInput = String(-1 * currentValue)
                updateDisplay(currentInput)
            }
        
        case "%":
            if let currentValue = Double(currentInput.trimmingCharacters(in: .whitespaces)) {
                currentInput = String(currentValue / 100)
                updateDisplay(currentInput)
            }

        case "=":
            evaluateExpression()
        
        case "Clear":
            currentInput = ""
            updateDisplay("0")

        default:
            break
        }
    }
    
    func evaluateExpression() {
        let expression = NSExpression(format: currentInput)
        if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            currentInput = String(describing: result)
            updateDisplay(currentInput)
        } else {
            updateDisplay("Error")
        }
    }
    
    func isLastCharacterOperator() -> Bool {
        let operators = ["+", "-", "*", "/"]
        let lastCharacter = currentInput.split(separator: " ").last
        return lastCharacter != nil && operators.contains(String(lastCharacter!))
    }

    func updateDisplay(_ text: String) {
        Result.text = text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial display setup
        updateDisplay("0")
    }
}
