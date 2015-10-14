//
//  ViewController.swift
//  coreDataIntro
//
//  Created by Jordan Weaver on 10/18/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    var count:Int = 0;
    
    
    /* NSManagedObject */
    /* is a generic class that implements all of the basic behaviors required for a Core Data Model Object. NSManagedObjects are what get saved and fetched to/from the harddrive. */
    
    /* -- Core Data Objects*/
    /* We need a few things to help us talk to Core Data. Our goal is to end up with an NSManagedObject of the same kind that we made in our .xcdatamodel */
    
    /* Reference to our AppDelegate. It happens to be unowned and safe for ARC */
    private let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
    
    /* -ManagedObjectContext - this is Our Notepad. We write on the notepad then save the notepad to the device. It's our data middle man between our code and the harddrive. */
    
    private var managedContext:NSManagedObjectContext!
    
    
    /* Variable used to help us describe a specific Core Data Entity */
    private var entityDescription:NSEntityDescription!
    
    /* Variable used to represent the entity "NumTaps" that we made in .xcdatamodel 
        We use the entity description above to help us build the right kind of entity. */
    
    /* This is where our Data Lives. Everything else is just setup. */
    private var numTaps:NSManagedObject!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /* -- Set Up Core Data Objects */
        
        /* Make sure our stored property is the sae as the App's Managed Context. */
        managedContext = appDelegate.managedObjectContext!
        
        /* Fill Out our Entity Description */
        entityDescription = NSEntityDescription.entityForName("NumTaps", inManagedObjectContext: managedContext);
        
        /* Use the description to make numTaps a "NumTaps" entity. And write it on our notepad (managedContext) */
        numTaps = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: managedContext);
        
        
        
        
        
        countLabel.text = count.description;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAddTap(sender: AnyObject) {
        /* Prefix In Line Increment Operator */
        countLabel.text = (++count).description;
    }
    
    @IBAction func saveBtn(sender: AnyObject) {
        /* We are updating the notepad (managedContext). */
        numTaps.setValue(count, forKey: "tapCount");
        
        /* Nothing is saved Yet! */
        
        var error:NSError?
        
        /* .save is where we are actually saving the whole notepad to the harddrive. */
        if !managedContext.save(&error){
            println("Error."); //catches and prints error IF there is one. 
        }
        
        
    }

    @IBAction func loadBtn(sender: AnyObject) {
        
        /* We use fetch requests to specify what kind of data we want to find. */
        var fetchRequest = NSFetchRequest(entityName: "NumTaps");
        
        var error:NSError?
        
        /* Here is where we actually pull data from the harddrive. and dump it into a variable */
        /* We cast to [NSManagedObject]? because the fetch request returns [AnyObject]? It's optional because this call could return zero or many objects. */
        let fetchResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        /* if the results aren't nil we want to do something with them. */
        
        if let results = fetchResults? {
            
            /* Update our stored property (count) with want we found on the hard drive */
            /* Must cast the info to an Int in order put it into count */
            
            /* kind of cheating with [0]. Ususally you'll have a full array of data. */
            numTaps = results[0];
            
            /* Update Properties and UI*/
            count = numTaps.valueForKey("tapCount") as Int;
            countLabel.text = count.description;
            
        }
        
        
    }
    
    
}

