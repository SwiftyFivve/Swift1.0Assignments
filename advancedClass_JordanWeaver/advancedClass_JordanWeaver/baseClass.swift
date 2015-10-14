//
//  baseClass.swift
//  advancedClass_JordanWeaver
//
//  Created by Jordan Weaver on 10/11/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import Foundation

class baseClass {
    
    /* Stored Properties*/
    var verb:String;
    var movie:String;
    var name:Int;
    var someNum:Int = 0;
    var numOfCrash:Int = 1;
    
    
    
    /* --Computed Properties*/
    
    var description:String {
        get{
            var localString:String = "";
            if name == 0 {
                localString =  "\nOne day while Jordan was \(verb), he decided to turn on \(movie).\n";
            }
            else if name == 1 {
                localString =  "\nOne day while Anatoly was \(verb), he decided to turn on \(movie).\n";
            }
            else {
                localString =  "\nOne day while Jamie was \(verb) when he decided to buy \(someNum) cars.\n";
            }

            return localString;
        }
    }
    
    
    
    
    /* -- Initializer*/
    
    init() {
        verb = "dancing";
        movie = "The Notebook";
        name = 2;
        someNum = 5;
    }
    
    init(_verb:String, _movie:String, _name:Int) {
        verb = _verb;
        movie = _movie;
        name = _name;
        someNum = 5;
        
    }
    
    
    
    /* --Instance Methods*/
    func printDescription () { println(self.description); }
    
    func crashed(){
        
        while someNum > 0 {
            someNum -= numOfCrash;
            if someNum <= 0 {
                println("Jamie crashed all his cars. Shouldn't drink and drive...\n");
            }
            else {
                println("Jamie crashed one car, now he only has \(someNum).");
            }
        }
        
        
    }
    
    
    
    /* --Type Method*/
    
    class func boughtMore(var _someNum:Int) {
        let increase:Int = 1;
        if _someNum > 5 {
            return
        }
        
        while _someNum <= 5 {
            _someNum += increase;
            
            if _someNum != 5 {
                println("Jamie bought another car, now he has \(_someNum) cars.");
            }
            else {
                println("Jamie must be rich since he goes through cars like they're batteries");
            }
            
        }
    }
}
