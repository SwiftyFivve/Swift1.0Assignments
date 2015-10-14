//
//  ViewController.swift
//  dictionariesAndOptionals_day3
//
//  Created by Jordan Weaver on 10/4/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*Creating Empty Dictionaries - 4 different ways*/
    var emptyDictionary_0: Dictionary<String, Int> = Dictionary<String, Int>();
    var emptyDictionary_1: [String: Int] = [String: Int]();
    var emptyDictionary_2 = [String: Int](); //Dictionary<String, Int>()
    var emptyDictionary_3: Dictionary<Double, Int> = [Double: Int]();
    
    /*Creating a dictionary with values*/
    var pGrades:[String: Int] = ["Bob": 70, "Tina": 80, "Pam": 90, "Ray": 100];
    
    
    
    /*Declaring Optionals*/
    var string_1:String? = nil; 
    var int_1:Int?;
    var string_2:String? = "Equal to a String";
    var string_3:String? = String(); // = ""
    
    var a:Int?;
    var b:Float?;
    var c:Character?;
    var d:ViewController?;
    var e:UIButton?;
    var f:UICollectionViewDelegate?;
    /* The point is that any type can be an Optional. The type tells us what kind of object we MIGHT find inside the box. */
    
    /* Con't set normal types to nil*/
    // var nope:Int = nil;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(pGrades);
        
        /*Adding entries to a Dictionary*/
        pGrades["Mack"] = 85;
        pGrades["Charlie"] = 75;
        pGrades["Dennis"] = 60;
        
        
        /*Updating Existing Entries*/
        /*If using a key that already exists, The value at that key is updated*/
        pGrades["Dennis"] = 67;
        
        /*Different way to add and update dictionary entries*/
        pGrades.updateValue(99, forKey: "Frank"); //Will add an entry 
        pGrades.updateValue(55, forKey: "Frank"); //Updates existing value
        
        
        /*-- Removing Entries for a Dictionart*/
        pGrades["Bob"] = nil;
        pGrades.removeValueForKey("Tina"); // return nil if not find, or returns the value if it was found.
        
        
        for (name, grades) in pGrades {
            //Do Someting
           // println("Student: \(name) has a grade of: \(grades).");
        }
        
        /*Accessing Entries in a Dictionary*/
        let grade:Int? = pGrades["Charlie"];
        println("Grade is : \(grade! + 10)"); //Force Unwrapping - is Dangerous
        
        /* --Optionals*/
        /*Use optional types in situation where a value may be absent.*/
        /*Optionals will either contain the expected type or contain nil.*/
        /*Swift has no pointer. Optionals help fill the need to have no value*/
        
        /* Think of an optional variable as a box. This box can only ever hold one thing of nothing. When we refer to an optional variable, we are referring to the box that may contain a value. To use the value inside the box we have to unwrap or open the box to see or get what's inside. */
        
        let badGrade:Int? = pGrades["Dee"];
        println(badGrade);
        
        
        let possibleNumber:String = "900s0";
        let convertedNumber:Int? = possibleNumber.toInt();
        
        
        /*Is the box emtpy or dull? Does it contain a value or nil?*/
        if convertedNumber != nil {
            println("\(convertedNumber!)"); //Forced unwrapping is ok because we know converted number is valid.
        }else{
            println("Converted number was nil");
        }
        
        /* Optional Binding -- A better way to check optionals. */
        var optDouble:Double? = 123.45;
        
        if let realNumber:Double = optDouble? {
            println(realNumber);
        }
        else{
            println("OpDouble was nil");
        }
        
        
        
        /*Optional Chaining*/
        /*Object.struct?.delegate?.parameter?*/
        /*Optional chaining lets us evaluate each optional value as we drill down into the structure of some object or class*/
        
        
        var myDictionary: [String: [Int]] = ["Ones":[1,2,3], "Tens":[10,20,30], "Hundreds":[100,200,300]];
        
        
        /*To get to the number 20...*/
        var x:Int = myDictionary["Tens"]![1];
        println("\(x)");
        
        /*Again, forced unwrapping is dangerous*/
        //var y:Int = myDictionary["Thousands"]![1];
        //println("\(y)");
        
        /*Optional Binding*/
        if var num = myDictionary["Tens"]?[1] {
            /*Changing num's value*/
            num += 10;
            num /= 2;
            num *= 45;
            println("\(num)");
        }
        
        let integer_1:Int? = nil;
        let integer_2:Int? = 700;
        let integer_3:Int = 45;
        //println(pGrades);
        
        OptionalFunction(integer_1);
        OptionalFunction(integer_2);
        OptionalFunction(integer_3);
        OptionalFunction(865);
        
        /*Be careful with Optional Values in Dictionaries and subscript shortcuts*/
        
        var myDict: [String: Int?] = ["One": 1, "Two": 2, "Three": 3, "Four": nil];
        
        /*I want to set key "Two" to nil*/
        myDict["Two"] = 54;
        println(myDict);
        
        myDict.updateValue(nil, forKey: "Two");
        println(myDict);
        
        //erases key
        myDict["Two"] = nil; // ^ You must use updateValue. Subscript Deletes the entry when setting to nil.
        println(myDict);
        
        

    }
    
    
    /*Class Scope*/
    
    /*Optional can be passed in OR returned from function*/
    func OptionalFunction(int: Int?) /*-> Double?*/ {
        if let num = int? {
            println(num);
        }else{
            println("num was nil");
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

