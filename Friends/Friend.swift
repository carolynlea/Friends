//
//  Friend.swift
//  Friends
//
//  Created by Carolyn Lea on 8/30/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation
import UIKit

struct Friend
{
    var name: String
    var image: UIImage
    var bio: String
    
//    init(name: String, image: UIImage, bio: String)
//    {
//        self.name = name
//        self.image = image
//        self.bio = bio
//    }
    
    
}

var friends = [Friend]()

let friend1 = Friend(name: "Frodo", image: UIImage(named: "penguin1")!, bio: "Most courageous buddy.")
let friend2 = Friend(name: "Sam", image: UIImage(named: "penguin2")!, bio: "Steady and faithful friend.")
let friend3 = Friend(name: "Pippin", image: UIImage(named: "penguin3")!, bio: "Very fun friend who steps up when needed.")
let friend4 = Friend(name: "Merry", image: UIImage(named: "penguin4")!, bio: "Loyal and brave friend.")
let friend5 = Friend(name: "Fredegar", image: UIImage(named: "penguin5")!, bio: "Slow and steady friend.")
let friend6 = Friend(name: "Elanor", image: UIImage(named: "penguin6")!, bio: "She's just plain cute.")


