//
//  bookInfo.swift
//  classBasics_JW
//
//  Created by Jordan Weaver on 10/9/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import Foundation


class bookInfo {
    
    /* --Stored Properties*/
    /* Stored Properties with Default Values */
    
    var bookTitle:String = "";
    var pledgedread:Int = 0;
    /*back use*/
    let pagesInDict:Int = 15490;
    
    
    
    /*Stored Properties with no Values*/
    private var numberOfPages:Int;
    var pagesRead:Int;
    
    
    
    
    /* --Computed Properties */
    /*compares numbers*/
    var largerThanDict:(Bool){
        get{
            if numberOfPages >= pagesInDict {
                return true;
            }else{
                return false;
            }
        }
    }
    
    /*final post sentence*/
    var description: String {
        get{
            var fullStr = "\nThe book is called \(bookTitle). \n";
            
            fullStr += "I am on page \(pagesRead). \n";
            
            fullStr += "This book has \(numberOfPages) pages. \n";
            
            if largerThanDict {
                fullStr += "This book is longer than the dictionary or over \(pagesInDict). \n";
            }
            else{
                fullStr += "This book is not longer than the dictionary, which is \(pagesInDict) pages. \n";
            }
            /*run method here from init*/
            fullStr += self.goingToRead(pledgedread);
            
            return fullStr;
        }
    }
    

    /*--Initailizer*/
    init(){
        bookTitle = "On The Road";
        numberOfPages = 350;
        pagesRead = 50;
        pledgedread = 50;
       
    }
    
    
    
    /*custom initializers*/
    init(_bookTitle:String, _numberOfPages:Int, _pagesRead:Int, _pledgeread:Int) {
        bookTitle = _bookTitle;
        numberOfPages = _numberOfPages;
        pagesRead = _pagesRead;
        pledgedread = _pledgeread;
    }
    
    
    /*--Methods*/
    func printDescription() {
        println(self.description);
    }
    
    /* Runs in Description Init so it displays in the console correctly. */
    func goingToRead(pagesToRead:Int) -> String {
        var numOfDays:Int = (numberOfPages - pagesRead) / pagesToRead;
        
        var lastStr:String = "If I read \(pagesToRead) pages a day, I would finish the book in \(numOfDays) days.";
    
        return lastStr;
    }

    
}
