//
//  ViewController.swift
//  cues
//
//  Created by Jordan Weaver on 10/2/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import UIKit

/*GCD - Grand Central Dispatch
    Is a sytem aof Queues that allows for simple multi Threading*/

/*Two types of Queues. Serial and Concerrent. Serial is first job starts executes, and finished then second job starts.
    
Concurrent is every job starts immediately upon being added to the queue.*/

/* UI Stuff Any UI stuff, ALWAYS always always always goes only on the main thread. Always.*/
var myQueue:dispatch_queue_t = dispatch_queue_create("com.MDF2.firstqueue", DISPATCH_QUEUE_SERIAL);

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(sender: UIButton) {
        
        /*Each dispatch is one job. If you want things to happen consurrently. You need more than one job.*/
        
       dispatch_async(myQueue, { () -> Void in
        NSThread.sleepForTimeInterval(4);
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Sleep is over"); //Pretent this is UI stuff
        })
       })
    }

}

