//
//  ViewController.swift
//  advancedClass_JordanWeaver
//
//  Created by Jordan Weaver on 10/11/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    
    @IBOutlet weak var textField_1: UITextField!
    @IBOutlet weak var textField_2: UITextField!
    @IBOutlet weak var textField_3: UITextField!
    @IBOutlet weak var textField_4: UITextField!
    
    
    @IBOutlet weak var controller: UISegmentedControl!
    @IBOutlet weak var textView: UITextView!
    
    
    /*Stored Property*/
    var jamie:baseClass = baseClass();
    var segmentSelected:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //default class/init/methods
        jamie.printDescription();
        jamie.crashed();
        baseClass.boughtMore(0);
        
    }
    
    /*changes words and click event depending on which ones clicked*/
    @IBAction func chooser(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            segmentSelected = 0;
            firstLabel.text = "Place:";
            secondLabel.text = "Verb:";
        }
        else{
            segmentSelected = 1;
            firstLabel.text = "Food:";
            secondLabel.text = "Woman Celebrity:";
        }
    }
    
    /*Button click, decides which one is selected*/
    @IBAction func theDoITButton(sender: AnyObject) {
        if controller.selectedSegmentIndex == 0 {
            //run Jordan, This works
            var jordan:jordanClass = jordanClass(_v: textField_1.text, _m: textField_2.text, _n: controller.selectedSegmentIndex, _place: textField_3.text, _verb2: textField_4.text);
            jordanClass.boughtMore(0);
            jordan.jordanInstance();
            textView.text = jordan.description2;
        }
        else {
            var anatoly:anatolyClass = anatolyClass(_v: textField_1.text, _m: textField_2.text, _n: controller.selectedSegmentIndex, _food: textField_3.text, _celeb: textField_4.text);
            anatoly.printDescription();
            anatoly.crashed();
            anatolyClass.moreFood();
            textView.text = anatoly.description1;
        }
    }
    
    //allows keyboard to hide
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        textField_1.becomeFirstResponder();
        textField_1.resignFirstResponder();
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

