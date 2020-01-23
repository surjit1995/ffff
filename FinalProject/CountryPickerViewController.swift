//
//  CategoryPickerViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2020-01-21.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class CountryPickerViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    var selected = ""
    var checkVC = false
    var country_list = ["America","Bulgaria","Canada","Denmark","England","India","Iran","Singapore","China","Switzerland","Iraq","Mexico","Malaysia"]
    //var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        
       
    }
  
            func goToFirstViewController() {
        
        if checkVC == true{
            let vc = self.navigationController?.viewControllers[1] as! EditPage
                   vc.selectedCountry = selected
                   
                   
                   self.navigationController?.popViewController(animated: true)
        }else{
            let vc = self.navigationController?.viewControllers[1] as! Update
                   vc.selectedCountry = selected
                   
                   
                   self.navigationController?.popViewController(animated: true)
        }
       


            
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = country_list[indexPath.row]
        
        return cell
        //        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedList = country_list[indexPath.row]
            
            if let viewController = storyboard?.instantiateViewController(identifier: "EditPage}") as? EditPage{
                navigationController?.pushViewController(viewController, animated: true)
                UserDefaults.standard.set(selectedList, forKey: "country")
                if let navController = self.navigationController {
                    navController.popViewController(animated: true)
                    print("Did Select Called")
                }
            }
        }
        func viewDidAppear(animated: Bool) {
            super.viewDidAppear(animated)
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: animated)}
            
        }
    }
    
}

