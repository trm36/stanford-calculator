//
//  ViewController.swift
//  Calculator
//
//  Created by Taylor Mott on 13 Jul 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let displayLabel = UILabel()
    let displayBackground = UIView()
    var userIsInTheMiddleOfTypingANumber = false
    var displayValue: Double {
        get {
            return (displayLabel.text! as NSString).doubleValue
        }
        
        set {
            self.displayLabel.text = "\(newValue)"
            self.userIsInTheMiddleOfTypingANumber = false
        }
    }
    let brain = CalculatorBrain()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Row 1
        self.displayBackground.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.displayBackground)
        
        self.displayLabel.text = "0"
        self.displayLabel.font = UIFont.systemFontOfSize(32)
        self.displayLabel.textAlignment = NSTextAlignment.Right
        self.view.addSubview(self.displayLabel)
        
        self.displayLabel.alignTop("20", leading: "5", toView: self.view)
        self.displayLabel.alignTrailingEdgeWithView(self.view, predicate: "-5")
        self.displayLabel.constrainHeight("50")
        self.displayBackground.alignTop("0", leading: "0", bottom: "0", trailing: "0", toView: self.displayLabel)
        
        //Row 2
        let button7 = UIButton()
        button7.setTitle("7", forState: .Normal)
        button7.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button7.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button7)
        
        let button8 = UIButton()
        button8.setTitle("8", forState: .Normal)
        button8.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button8.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button8)
        
        let button9 = UIButton()
        button9.setTitle("9", forState: .Normal)
        button9.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button9.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button9)
        
        let buttonDivide = UIButton()
        buttonDivide.setTitle("÷", forState: .Normal)
        buttonDivide.setTitleColor(UIColor.blackColor(), forState: .Normal)
        buttonDivide.addTarget(self, action: "operate:", forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonDivide)
        
        button7.constrainTopSpaceToView(self.displayLabel, predicate: "5")
        button7.alignLeadingEdgeWithView(self.displayLabel, predicate: "0")
        
        button8.alignTopEdgeWithView(button7, predicate: "0")
        button8.constrainLeadingSpaceToView(button7, predicate: "0")
        
        button9.alignTopEdgeWithView(button7, predicate: "0")
        button9.constrainLeadingSpaceToView(button8, predicate: "0")
        
        buttonDivide.alignTopEdgeWithView(button7, predicate: "0")
        buttonDivide.constrainLeadingSpaceToView(button9, predicate: "0")
        buttonDivide.alignTrailingEdgeWithView(self.displayLabel, predicate: "0")
        
        //Row 3
        let button4 = UIButton()
        button4.setTitle("4", forState: .Normal)
        button4.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button4.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button4)
        
        let button5 = UIButton()
        button5.setTitle("5", forState: .Normal)
        button5.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button5.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button5)
        
        let button6 = UIButton()
        button6.setTitle("6", forState: .Normal)
        button6.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button6.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button6)
        
        let buttonMultiply = UIButton()
        buttonMultiply.setTitle("×", forState: .Normal)
        buttonMultiply.setTitleColor(UIColor.blackColor(), forState: .Normal)
        buttonMultiply.addTarget(self, action: "operate:", forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonMultiply)
        
        button4.constrainTopSpaceToView(button7, predicate: "0")
        button4.alignLeadingEdgeWithView(self.displayLabel, predicate: "0")
        
        button5.alignTopEdgeWithView(button4, predicate: "0")
        button5.constrainLeadingSpaceToView(button4, predicate: "0")
        
        button6.alignTopEdgeWithView(button4, predicate: "0")
        button6.constrainLeadingSpaceToView(button5, predicate: "0")
        
        buttonMultiply.alignTopEdgeWithView(button4, predicate: "0")
        buttonMultiply.constrainLeadingSpaceToView(button6, predicate: "0")
        buttonMultiply.alignTrailingEdgeWithView(self.displayLabel, predicate: "0")
        
        //Row 4
        let button1 = UIButton()
        button1.backgroundColor = .redColor()
        button1.setTitle("1", forState: .Normal)
        button1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button1.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button1)
        
        let button2 = UIButton()
        button2.backgroundColor = .yellowColor()
        button2.setTitle("2", forState: .Normal)
        button2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button2.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button2)
        
        let button3 = UIButton()
        button3.backgroundColor = .orangeColor()
        button3.setTitle("3", forState: .Normal)
        button3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button3.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button3)
        
        let buttonSubtract = UIButton()
        buttonSubtract.setTitle("−", forState: .Normal)
        buttonSubtract.setTitleColor(UIColor.blackColor(), forState: .Normal)
        buttonSubtract.addTarget(self, action: "operate:", forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonSubtract)
        
        button1.constrainTopSpaceToView(button4, predicate: "0")
        button1.alignLeadingEdgeWithView(self.displayLabel, predicate: "0")
        
        button2.alignTopEdgeWithView(button1, predicate: "0")
        button2.constrainLeadingSpaceToView(button1, predicate: "0")
        
        button3.alignTopEdgeWithView(button1, predicate: "0")
        button3.constrainLeadingSpaceToView(button2, predicate: "0")

        buttonSubtract.alignTopEdgeWithView(button1, predicate: "0")
        buttonSubtract.constrainLeadingSpaceToView(button3, predicate: "0")
        buttonSubtract.alignTrailingEdgeWithView(self.displayLabel, predicate: "0")
        
        //Row 5
        let buttonEnter = UIButton()
        buttonEnter.backgroundColor = .purpleColor()
        buttonEnter.setTitle("↩︎", forState: .Normal)
        buttonEnter.setTitleColor(UIColor.blackColor(), forState: .Normal)
        buttonEnter.addTarget(self, action: "enter", forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonEnter)
        
        let button0 = UIButton()
        button0.backgroundColor = .blueColor()
        button0.setTitle("0", forState: .Normal)
        button0.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button0.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button0)
        
        let buttonSqrt = UIButton()
        buttonSqrt.setTitle("√", forState: .Normal)
        buttonSqrt.setTitleColor(UIColor.blackColor(), forState: .Normal)
        buttonSqrt.addTarget(self, action: "operate:", forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonSqrt)
        
        let buttonAdd = UIButton()
        buttonAdd.setTitle("+", forState: .Normal)
        buttonAdd.setTitleColor(UIColor.blackColor(), forState: .Normal)
        buttonAdd.addTarget(self, action: "operate:", forControlEvents: .TouchUpInside)
        self.view.addSubview(buttonAdd)
        
        buttonEnter.constrainTopSpaceToView(button1, predicate: "0")
        buttonEnter.alignLeadingEdgeWithView(self.displayLabel, predicate: "0")
        buttonEnter.alignBottomEdgeWithView(self.view, predicate: "-5")
        
        button0.alignTopEdgeWithView(buttonEnter, predicate: "0")
        button0.constrainLeadingSpaceToView(buttonEnter, predicate: "0")
        
        buttonSqrt.alignTopEdgeWithView(buttonEnter, predicate: "0")
        buttonSqrt.constrainLeadingSpaceToView(button0, predicate: "0")
        
        buttonAdd.alignTopEdgeWithView(buttonEnter, predicate: "0")
        buttonAdd.constrainLeadingSpaceToView(buttonSqrt, predicate: "0")
        buttonAdd.alignTrailingEdgeWithView(self.displayLabel, predicate: "0")
        
        UIView.equalHeightForViews([button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonEnter, buttonDivide, buttonMultiply, buttonSubtract, buttonAdd, buttonSqrt])
        UIView.equalWidthForViews([button0, button1, button2, button3, button4, button5, button6, button7, button8, button9, buttonEnter, buttonDivide, buttonMultiply, buttonSubtract, buttonAdd, buttonSqrt])
    }
    
    
    func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        
        if self.userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        if let result = self.brain.performOperation(operation) {
            displayValue = result
        } else {
            //get rid of display
            println("error paul was talking about with display value not being an optional")
        }
    
    }
    
    func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if !(digit == "0" && self.displayLabel.text! == "0") {
            if userIsInTheMiddleOfTypingANumber && self.displayLabel.text! != "0" {
                self.displayLabel.text = self.displayLabel.text! + digit
            } else {
                self.displayLabel.text = digit
            }
        }
        self.userIsInTheMiddleOfTypingANumber = true
        
        println("\(digit)")
        println("\(self.userIsInTheMiddleOfTypingANumber)")
    }
    
    func enter () {
        self.userIsInTheMiddleOfTypingANumber = false
        if let result = self.brain.pushOperand(self.displayValue) {
            self.displayValue = result
        } else {
            // get rid of display
            println("error paul was talking about in lecture 3")
        }

        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.displayBackground.alpha = 0.5
        }) { (_) -> Void in
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.displayBackground.alpha = 1.0
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

