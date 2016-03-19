//
//  InstagramViewController.swift
//  instagram-with-parse
//
//  Created by Christopher Yang on 3/13/16.
//  Copyright © 2016 Christopher Yang. All rights reserved.
//

import UIKit
import Parse

class InstagramViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        
        print("Logged out")
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCaptureButton(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            vc.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            print("Camera not available")
            vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            let submitViewController = storyboard?.instantiateViewControllerWithIdentifier("SubmitViewController") as! SubmitViewController
            
            submitViewController.selectedImage = originalImage
            
            picker.presentViewController(submitViewController, animated: true, completion: nil)
            
            // Dismiss UIImagePickerController to go back to your original view controller
//            dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
