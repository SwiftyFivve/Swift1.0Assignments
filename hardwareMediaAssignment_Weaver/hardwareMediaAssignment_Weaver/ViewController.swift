//
//  ViewController.swift
//  hardwareMediaAssignment_Weaver
//
//  Created by Jordan Weaver on 10/14/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    let pickerController: UIImagePickerController = UIImagePickerController();
    let cameraController: UIImagePickerController = UIImagePickerController();
    
    /*SFX Properties */
    var clickSound:SystemSoundID = 0;
    var cancelSound:SystemSoundID = 0;


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerController.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
        cameraController.sourceType = UIImagePickerControllerSourceType.Camera;
        
        pickerController.delegate = self;
        cameraController.delegate = self;
        
        
        
        /* Setup Sounds */
        var ls = NSBundle.mainBundle().pathForResource("click_start", ofType: "wav");
        var url:NSURL? = NSURL.fileURLWithPath(ls!);
       
        
        
        var cs = NSBundle.mainBundle().pathForResource("knock", ofType: "wav");
        var newUrl:NSURL? = NSURL.fileURLWithPath(cs!);
        
        /* Create Sound */
        AudioServicesCreateSystemSoundID(url, &clickSound);
        AudioServicesCreateSystemSoundID(newUrl, &cancelSound);
    }

    @IBAction func cameraBtn(sender: AnyObject) {
        AudioServicesPlaySystemSound(clickSound);
        self.presentViewController(cameraController, animated: true, completion: nil);
    }

    @IBAction func savedPhtBtn(sender: AnyObject) {
        AudioServicesPlaySystemSound(clickSound);
        self.presentViewController(pickerController, animated: true, completion: nil);
    }
    
    @IBAction func saveBtn(sender: AnyObject) {
        AudioServicesPlaySystemSound(clickSound);
        if let i = imgView.image? {
            UIImageWriteToSavedPhotosAlbum(i, nil, nil, nil);
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {

        let img:UIImage = info["UIImagePickerControllerOriginalImage"] as UIImage;
        
        //Do something with it
        imgView.image = img;
        
        //Remember to dismiss the view when we're done.
        picker.dismissViewControllerAnimated(true, completion: nil);
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        AudioServicesPlaySystemSound(cancelSound);
        picker.dismissViewControllerAnimated(true, completion: nil);
    }

}

