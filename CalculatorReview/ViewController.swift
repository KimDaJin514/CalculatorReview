//
//  ViewController.swift
//  CalculatorReview
//
//  Created by 김다진 on 2023/03/15.
//

import UIKit

enum Operation {
    case Divide
    case Multiply
    case Subtract
    case Add
    case unknown
}

class ViewController: UIViewController {
    
    @IBOutlet weak var numberOutputLabel: UILabel!
    
    var firstOperString = ""
    var secondOperString = ""
    var currentOperation: Operation = .unknown
    
    var displayString = ""
    var resultString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tabNumberBtn(_ sender: UIButton) {
        
        // 첫번째연산자
        if let senderTxt = sender.titleLabel?.text, numberOutputLabel.text!.count < 9 {
            
            if self.currentOperation != .unknown {
                self.displayString = ""
            }
            
            self.displayString += senderTxt
            self.numberOutputLabel.text = self.displayString
            
        }
        
    }
    
    @IBAction func tabClearBtn(_ sender: UIButton) {
        self.displayString = ""
        self.currentOperation = .unknown
        self.firstOperString = ""
        self.secondOperString = ""
        self.resultString = ""
        self.numberOutputLabel.text = "0"
        
    }
    
    @IBAction func tabDotBtn(_ sender: UIButton) {
        if !self.displayString.contains("."), self.displayString.count < 8 {
            self.displayString += self.displayString.isEmpty ? "0." : "."
            self.numberOutputLabel.text = self.displayString
        }
    }
    
    @IBAction func tabDivide(_ sender: UIButton) {
        self.operation(oper: .Divide)
        
    }
    
    @IBAction func tabMultiply(_ sender: UIButton) {
        self.operation(oper: .Multiply)
    }
    
    @IBAction func tabSubtarct(_ sender: UIButton) {
        self.operation(oper: .Subtract)
    }
    
    
    @IBAction func tabAdd(_ sender: UIButton) {
        self.operation(oper: .Add)
    }
    
    @IBAction func tabEqual(_ sender: UIButton) {
        self.operation(oper: self.currentOperation)
    }
    
    // 숫자 외 버튼 눌렀을 때
    private func operation(oper: Operation){
        
        if self.currentOperation != .unknown {
            if !self.displayString.isEmpty {
                self.secondOperString = self.displayString
                self.displayString = ""
                
                guard let firstOperand = Double(self.firstOperString) else { return }
                guard let secondOperand = Double(self.secondOperString) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.resultString = "\(firstOperand + secondOperand)"
                case .Divide:
                    self.resultString = "\(firstOperand / secondOperand)"
                case .Subtract:
                    self.resultString = "\(firstOperand - secondOperand)"
                case .Multiply:
                    self.resultString = "\(firstOperand * secondOperand)"
                default:
                    break
                }
                
                if let result = Double(self.resultString), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.resultString = "\(Int(result))"
                }
                
                self.firstOperString = self.resultString
                self.numberOutputLabel.text = resultString
            }
            
            self.currentOperation = oper
        } else {
            // 7 + 만 한 상태
            // 계산 중간단계
            self.firstOperString = self.displayString
            self.currentOperation = oper
            self.displayString = ""
        }

    }
    
    // 여기수정
}

