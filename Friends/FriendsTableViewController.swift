//
//  FriendsTableViewController.swift
//  Friends
//
//  Created by Carolyn Lea on 8/30/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController
{
    let friends = [friend1, friend2, friend3, friend4, friend5, friend6]
    
    let navigationControllerDelegate = NavigationControllerDelegate()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController?.delegate = navigationControllerDelegate
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath)
        
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.imageView?.image = friend.image

        return cell
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ToDetailView"
        {
            guard let detailView = segue.destination as? DetailViewController,
                let indexPath = tableView.indexPathForSelectedRow,
                let cell = tableView.cellForRow(at: indexPath) else {return}
            detailView.friend = friends[indexPath.row]
            
            navigationControllerDelegate.sourceCell = cell
        }
    }
    


}
