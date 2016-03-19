//
//  SubmitViewController.swift
//  instagram-with-parse
//
//  Created by Christopher Yang on 3/18/16.
//  Copyright © 2016 Christopher Yang. All rights reserved.
//

import UIKit
import AFNetworking

class SubmitViewController: UIViewController {

    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedImageView.image = selectedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSubmitButton(sender: AnyObject) {
        // TODO: Post to instagram
        
        let caption = captionTextField.text
        
        Post.postUserImage(selectedImage, withCaption: caption) { (success: Bool, error: NSError?) -> Void in
            if let error = error {
                print("Post failed.")
                print(error.localizedDescription)
            } else {
                print("Post successful")
                self.presentingViewController!.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
            }
        }
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
