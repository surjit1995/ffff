//
//  ViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2020-01-20.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    static  var managedContext: NSManagedObjectContext!
    static let loadingCell = "LoadingCell"
    var isLoading = false
    
    @IBOutlet weak var searchbar: UISearchBar!
   
    @IBOutlet weak var mapview: UIView!
    
    @IBOutlet weak var listview: UIView!
    
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0
        {
            mapview.alpha = 1  //1 segemnt index for map
            listview.alpha = 0  //0 segemnt index for list
        }
        else
        {
            mapview.alpha = 0
            listview.alpha = 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    


}

extension ViewController: UISearchBarDelegate {
func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
print("The search text is: '\(searchBar.text!)'") }
}
