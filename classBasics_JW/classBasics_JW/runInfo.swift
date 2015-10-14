//
//  runInfo.swift
//  classBasics_JW
//
//  Created by Jordan Weaver on 10/9/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import Foundation



class runInfo {
    
    /* --Stored Properties*/
    /* Stored Properties with Default Values */
    var locationName:String = "";
    /*back use*/
    let lancesTime:Int = 0;
    
    
    /*Stored Properties with no Values*/
    private var runTime:Int;
    var distanceRan:Int;
    
    
    
    /*Computed Properties*/
    var fasterThanLance:(Bool){
        get{
            if runTime <= lancesTime {
                return true;
            }else{
                return false;
            }
        }
    }
    
    
    var description: String {
        get{
            var fullStr = "\nI ran at \(locationName) today. \n";
            
            fullStr += "I ran a distance of \(distanceRan) miles. \n";
            
            if fasterThanLance {
                fullStr += "Your time of \(runTime) minutes was faster than Lance Armstrong. \n";
            }
            else{
                fullStr += "Your time of \(runTime) minutes was NOT faster than Lance Armstrong. \n";
            }
            
            fullStr += compareLance();
            
            
            return fullStr;
        }
    }
    
    
    
    
    /*Initializers*/
    init() {
        locationName = "Blanchard Park";
        runTime = 16;
        distanceRan = 2;
    }
    
    init(_loctationName:String, _runTime:Int, _distanceRan:Int){
        locationName = _loctationName;
        runTime = _runTime;
        distanceRan = _distanceRan;
    }
    
    
    /*Methods*/
    func printDescription(){
        println(self.description);
    }
    
    
    func compareLance() ->String {
        for var i = 0; distanceRan > i; i++ {
            lancesTime + 5;
            println(lancesTime);
        }
        var differance = runTime - lancesTime;
        var lastStr:String = "There is a \(differance) minute differance compared to Lance";
            
        
        return lastStr;
    }
    
    
}