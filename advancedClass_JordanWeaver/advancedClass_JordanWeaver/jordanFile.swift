//
//  jordanFile.swift
//  advancedClass_JordanWeaver
//
//  Created by Jordan Weaver on 10/11/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import Foundation


class jordanClass:baseClass {
    
    /*Stored Properties*/
    var place:String?;
    var verb2:String?;
    
    
    /*--Computed Properties*/
    var description2:String {
        get{
            var localString:String = "";
                localString =  "\nOne day while Jordan was \(verb), he decided to turn on \(movie).\n";
            if let thisPlace = place {
                if let thisVerb = verb2 {
                    localString += "After the movie Jordan decided to go to \(thisPlace) and \(thisVerb).\n";
                }
            }
            
            return localString;
        }
    }
    

    
    
    /*--SubClass Initializer*/
    init(_v:String, _m:String, _n:Int, _place:String, _verb2:String){
        super.init(_verb: _v, _movie: _m, _name: _n);
        place = _place;
        verb2 = _verb2;
    }
    
    
    /*--Instance method*/
    func jordanInstance() {
        //prints str from base class on purpose
        printDescription();
    }
    
    
    
    /*--OverRide Type Method*/
    override class func boughtMore(var _someNum:Int) {
        let increase:Int = 1;
        if _someNum > 5 {
            return
        }
        
        while _someNum <= 5 {
            _someNum += increase;
            
            if _someNum != 5 {
                println("\nThis is an overridden Type Method in JordanFile that counts up to: \(_someNum) ");
            }
            else {
                println("Jordan File count down complete.");
            }
            
        }
    }
    
    
}