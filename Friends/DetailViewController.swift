//
//  DetailViewController.swift
//  Friends
//
//  Created by Carolyn Lea on 8/30/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    var friend: Friend?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        friendImageView.image = friend?.image
        nameLabel.text = friend?.name
        bioTextView.text = friend?.bio
    }


    
    

    

}
