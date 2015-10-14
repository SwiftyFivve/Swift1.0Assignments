//
//  ViewController.swift
//  classBasics_JW
//
//  Created by Jordan Weaver on 10/9/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    /*Default Initializers*/
    var myBook = bookInfo();
    var myRun = runInfo();
    
    
    /*Book info Outlets*/
    @IBOutlet weak var bookTitle: UITextField!
    @IBOutlet weak var numOfPages: UITextField!
    @IBOutlet weak var pagesRead: UITextField!
    @IBOutlet weak var readPledge: UITextField!
    
    
    /*Running info outlets*/
    @IBOutlet weak var distance: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var location: UITextField!
    
    
    /*text view*/
    @IBOutlet weak var textView_all: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*Runs default variables*/
        myBook.printDescription();
        myRun.printDescription();
    }

    /*Book info button*/
    @IBAction func runButton(sender: AnyObject) {
       
        
        /*Custom Initializer*/
        /* If checks to make sure user input is correct*/
        if let read = pagesRead.text.toInt(){
            if let pages:Int = numOfPages.text.toInt() {
                if let pleadge:Int = readPledge.text.toInt() {
                    var userBook = bookInfo(_bookTitle: bookTitle.text, _numberOfPages: pages, _pagesRead: read, _pledgeread: pleadge);
                    /*console log*/
                    userBook.printDescription();
                    /*text post*/
                    textView_all.text = userBook.description;
                }
                    /*Else statements clear user input if incorrect data is entered. Only one fire at a time, but user will still understand if they're a dumbass. */
                else {
                    readPledge.text = "";
                }
            }
            else{
                numOfPages.text = "";
            }
        }
        else{
            pagesRead.text = "";
        }
        
        
        
        
    }
    
    /*Handles clearing keyboard*/
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        bookTitle.becomeFirstResponder();
        bookTitle.resignFirstResponder();
    }
    
    
    /*Running info button*/
    /* If checks to make sure user input is correct*/
    @IBAction func runButton_2(sender: AnyObject) {
        if var distantRan = distance.text.toInt() {
            if var runTime = time.text.toInt() {
                var userRun = runInfo(_loctationName: location.text, _runTime: runTime, _distanceRan: distantRan);
                userRun.printDescription();
                textView_all.text = userRun.description;
            }
                /*Else statements clear user input if incorrect data is entered. Only one fire at a time, but user will still understand if they're a dumbass. */
            else {
                time.text = nil;
            }
        }
        else {
            distance.text = nil;
        }
    }

    
    /*clears text field*/
    @IBAction func clearButton(sender: AnyObject) {
        textView_all.text = nil;
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

