//
//  PostCell.swift
//  instagram-with-parse
//
//  Created by Christopher Yang on 3/18/16.
//  Copyright © 2016 Christopher Yang. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var postedImageView: PFImageView!
    
    var post: PFObject! {
        didSet {
            captionLabel.text = post["caption"] as? String
            postedImageView.file = post["media"] as? PFFile
            postedImageView.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
