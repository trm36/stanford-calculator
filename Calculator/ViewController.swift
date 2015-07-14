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
    var userIsInTheMiddleOfTypingANumber: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Row 1
        self.displayLabel.text = "0"
        self.displayLabel.font = UIFont.systemFontOfSize(32)
        self.displayLabel.textAlignment = NSTextAlignment.Right
        self.displayLabel.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(displayLabel)
        
        self.displayLabel.alignTop("20", leading: "5", toView: self.view)
        self.displayLabel.alignTrailingEdgeWithView(self.view, predicate: "-5")
        
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
        
        button7.constrainTopSpaceToView(self.displayLabel, predicate: "5")
        button7.alignLeadingEdgeWithView(self.displayLabel, predicate: "0")
        button7.constrainHeight("50")
        
        button8.alignTopEdgeWithView(button7, predicate: "0")
        button8.constrainLeadingSpaceToView(button7, predicate: "0")
        
        button9.alignTopEdgeWithView(button7, predicate: "0")
        button9.constrainLeadingSpaceToView(button8, predicate: "0")
        button9.alignTrailingEdgeWithView(self.displayLabel, predicate: "0")
        
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
        
        button4.constrainTopSpaceToView(button7, predicate: "0")
        button4.alignLeadingEdgeWithView(self.displayLabel, predicate: "0")
        button4.constrainHeight("50")
        
        button5.alignTopEdgeWithView(button4, predicate: "0")
        button5.constrainLeadingSpaceToView(button4, predicate: "0")
        
        button6.alignTopEdgeWithView(button4, predicate: "0")
        button6.constrainLeadingSpaceToView(button5, predicate: "0")
        button6.alignTrailingEdgeWithView(self.displayLabel, predicate: "0")
        
        //Row 4
        let button1 = UIButton()
        button1.setTitle("1", forState: .Normal)
        button1.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button1.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button1)
        
        let button2 = UIButton()
        button2.setTitle("2", forState: .Normal)
        button2.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button2.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button2)
        
        let button3 = UIButton()
        button3.setTitle("3", forState: .Normal)
        button3.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button3.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button3)
        
        button1.constrainTopSpaceToView(button4, predicate: "0")
        button1.alignLeadingEdgeWithView(self.displayLabel, predicate: "0")
        button1.constrainHeight("50")
        
        button2.alignTopEdgeWithView(button1, predicate: "0")
        button2.constrainLeadingSpaceToView(button1, predicate: "0")
        
        button3.alignTopEdgeWithView(button1, predicate: "0")
        button3.constrainLeadingSpaceToView(button2, predicate: "0")
        button3.alignTrailingEdgeWithView(self.displayLabel, predicate: "0")
        
        
        //Row 5
        let button0 = UIButton()
        button0.setTitle("0", forState: .Normal)
        button0.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button0.addTarget(self, action: "appendDigit:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button0)
        
        button0.constrainTopSpaceToView(button1, predicate: "0")
        button0.alignLeadingEdgeWithView(self.displayLabel, predicate: "0")
        button0.constrainHeight("50")
        
        UIView.equalHeightForViews([button0, button1, button2, button3, button4, button5, button6, button7, button8, button9])
        UIView.equalWidthForViews([button0, button1, button2, button3, button4, button5, button6, button7, button8, button9])
        
    }
    
    func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            self.displayLabel.text = self.displayLabel.text! + digit
        } else {
            self.displayLabel.text = digit
            self.userIsInTheMiddleOfTypingANumber = true
        }
        
        
        
        println("\(digit)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

