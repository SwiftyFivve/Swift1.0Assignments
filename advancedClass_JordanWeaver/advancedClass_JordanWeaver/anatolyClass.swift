//
//  anatolyClass.swift
//  advancedClass_JordanWeaver
//
//  Created by Jordan Weaver on 10/11/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import Foundation

class anatolyClass:baseClass {
    
    /*Stored Properties*/
    let food:String?;
    let celeb:String?;
    
    
    
    
    /*--Computed Properties*/
    var description1:String {
        get{
            var localString:String = "";
                localString =  "\nOne day while Anatoly was \(verb), he decided to turn on \(movie).\n";
                localString += "During the movie Anatoly ate some \(food) and dressed up like \(celeb).\n"
            
            return localString;
        }
    }
    
    
    /*--Create subclass initializer*/
    init(_v:String, _m:String, _n:Int, _food:String, _celeb:String){
        super.init(_verb: _v, _movie: _m, _name: _n);
        
        food = _food;
        celeb = _celeb;
        someNum = 10;
        
    }
    
    
    
    /*--Override Intance Method*/
    override func crashed() {
        while someNum > 0 {
            someNum -= numOfCrash;
            if let theFood = food {
                if someNum <= 0 {
                    println("Anatoly ate every crumb of food");
                }
                else {
                    println("Anatoly ate another \(theFood), and has \(someNum) left.");
                    NSThread.sleepForTimeInterval(0.3);
                }
            }
        }
    }
    
    
    /*--Type method*/
    class func moreFood() {
        print("Then he ate 20 pancakes.");
    }
    
}
