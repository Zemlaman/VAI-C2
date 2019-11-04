//
//  ViewController.swift
//  myCalc
//
//  Created by Matěj Žemlička on 04/11/2019.
//  Copyright © 2019 Matěj Žemlička. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var screenNumber:Double = 0
    var previousNumber:Double = 0;
    var mathPreforming = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func numbers(_ sender: UIButton) {
        label.text = label.text! + String(sender.tag-1)
        screenNumber = Double(label.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
            if label.text != "" && sender.tag != 11 && sender.tag != 16{
            previousNumber = Double(label.text!)!

            if sender.tag == 12 {

            label.text = "/";

            }

            if sender.tag == 13 {

            label.text = "x";

            }

            if sender.tag == 14 {

            label.text = "-";

            }

            if sender.tag == 15 {

            label.text = "+";

            }

            operation = sender.tag
            mathPreforming = true;

            
            } else if sender.tag == 16 {

            if operation == 12{

            label.text = String(previousNumber / screenNumber)

            } else if operation == 13{

            label.text = String(previousNumber * screenNumber)

            } else if operation == 14{

            label.text = String(previousNumber - screenNumber)

            } else if operation == 15{

            label.text = String(previousNumber + screenNumber)

            }

            } else if sender.tag == 11{

            label.text = ""
            previousNumber = 0;
            screenNumber = 0;
            operation = 0;
        }
    }
}





