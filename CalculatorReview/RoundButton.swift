//
//  RoundButton.swift
//  CalculatorReview
//
//  Created by 김다진 on 2023/03/15.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }

}
