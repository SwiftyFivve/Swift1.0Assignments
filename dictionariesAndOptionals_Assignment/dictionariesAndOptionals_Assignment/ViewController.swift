//
//  ViewController.swift
//  dictionariesAndOptionals_Assignment
//
//  Created by Jordan Weaver on 10/4/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiTextView: UITextView!
    
    let theFirstString: String? = "Anatoly cheats on life.";
    let explitInt: Int?;
    let thisIsATuple: (String, String)? = ("Anatoly", "eats eggs");
    let thisIsATupleWithFourElements: (Int?, Int?, Int?, Int?) = (29, 78, 89, 29);
    var ages:[String: Int] = ["John": 70, "Anatoly acts": 12, "Pete": 32, "Kevin": 33];
    var floatDict:[String: Float] = [String: Float]();
    var optionalDict:[String: String?] = ["backpack": "laptop", "wallet": "money", "phone": "case"];
    var tupleOptDict:[String: (String?, String?, String?)] = [String: (String?, String?, String?)]();
    var arrayDict: [String: [Double]] = ["1-4": [1.4, 2.6, 3.2, 4.7], "5-8": [5.4, 6.3, 7.5, 8.1], "9-12": [9.34, 10.093, 11.83, 12.94]];
    

    
    override func viewDidLoad() {
        
        println(optionalDict);
        
        addingToDictionaries();
        
        removeItems();
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func addingToDictionaries(){
        ages.updateValue(98, forKey: "Grandma");
        ages["Old Person"] = 89;
        
        floatDict.updateValue(78.38, forKey: "first_Num");
        floatDict["second_Num"] = 738.302;
        floatDict["third_Num"] = 383.38;
        floatDict["fourth_Num"] = 83.944;
        floatDict["fifth_Num"] = 83.39;
        
        optionalDict.updateValue("water", forKey: "waterBottle");
        optionalDict["pockets"] = "Car Keys";
        
        tupleOptDict.updateValue(("someStr", "AnotherStr", "lastStr"), forKey: "listOfStrings");
        tupleOptDict["secondListOfString"] = ("2", "3", "4");
        tupleOptDict["thirdListOfStrings"] = ("5", "6", "7");
        tupleOptDict["iHaveRunOutOfIdeas"] = ("8", "9", "10");
        tupleOptDict["uncreaticeTitle"] = ("11", "12", "14");
        
        arrayDict.updateValue([48.94, 84.200, 72.94, 95.4737], forKey: "randomNums");
        arrayDict["moreRandoms"] = [63.873, 7372.2839, 73.2820, 732.382];
        
        
    }
    
    
    func removeItems () {
        
        ages.removeValueForKey("John");
        ages["Pete"] = nil;
        
        floatDict.removeValueForKey("third_Num");
        floatDict["fifth_Num"] = nil;
        
        optionalDict.removeValueForKey("backpack");
        optionalDict["phone"] = nil;
        
        tupleOptDict.removeValueForKey("someStr");
        tupleOptDict["thirdListOfStrings"] = nil;
        
        arrayDict.removeValueForKey("5-8");
        arrayDict["9-12"] = nil;
        
    }
    
    
    
    @IBAction func ageButton(sender: AnyObject) {
        uiTextView.text = nil;
        
        for (key, value) in ages {
            uiTextView.text? += "\(key, value)\n";
        }
        
    }
    
    @IBAction func floatDict(sender: AnyObject) {
        uiTextView.text = nil;
        
        for (key, value) in floatDict {
            uiTextView.text! += "\(key, value)\n";
        }
    }
    
    
    @IBAction func optionalButton(sender: AnyObject) {
        uiTextView.text = nil;
        
        for (key, value) in optionalDict {
            if let value2 = value {
                uiTextView.text! += "\(key) \(value2)\n";
            } else {
                self.uiTextView.text! = "No value found.";
            }
        
        }
    }
    
    @IBAction func tupleButton(sender: AnyObject) {
        uiTextView.text = nil;
        
        for (key, value) in tupleOptDict {
            if let value0 = value.0 {
                self.uiTextView.text! += "\(key) \(value0)";
            }
            if let value1 = value.1 {
                self.uiTextView.text! += " \(value1)";
            }
            if let value2 = value.2 {
                self.uiTextView.text! += " \(value2) \n";
            }
        }
    }
    
    @IBAction func arrayButton(sender: AnyObject) {
        uiTextView.text = nil;
        var n = 0;
        
        for (key, value) in arrayDict {
            self.uiTextView.text! += "\(key)";
            for index in value {
                if n == (value.count - 1) {
                    self.uiTextView.text! += " \(index) \n";
                } else {
               self.uiTextView.text! += " \(index), ";
                n++ ;
                }
            }
            n = 0;
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

