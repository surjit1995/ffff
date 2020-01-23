//
//  List.swift
//  FinalProject
//
//  Created by MacStudent on 2020-01-21.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class List: UIViewController,UITableViewDelegate,UITableViewDataSource{

   
@IBOutlet weak var listView: UITableView!
        weak var delegate : ViewController?
       
    var Details:[Information] = []
        var index: Int = 0

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            //listView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            
            listView.delegate = self
            listView.dataSource = self
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            fetchData()
        }
        
        func fetchData(){
            
            var arrDetails = [Information]()
            let fetchRequest = NSFetchRequest<Information>(entityName: "Information")
            
            do{
                arrDetails = try ViewController.managedContext.fetch(fetchRequest)
            }catch{
                print(error)
            }
            Details = arrDetails
            
            listView.reloadData()
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Details.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
            //cell.textLabel?.text = studentDetails[indexPath.row]
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            //dateFormatter.dateFormat = "dd/MM/yyyy"
            
            let value = Details[indexPath.row]
            //cell.textLabel!.text = value.name! + ", " + String(value.tution) + ", " + String(value.age) + ", " + dateFormatter.string(from: value.date!)
            cell.nameLabel.text = "Name:  "+value.name!
            cell.genderLabel.text = "Gender:  "+value.gender!
            cell.countryLabel.text = "Country:  "+(value.country ?? "")
            cell.latiLabel.text = "Latitude:  "+String(value.latitude)
            cell.longiLabel.text = "Longitude:  "+String(value.longitude)
            cell.birthLabel.text = "Date:  "+dateFormatter.string(from: value.dob)
            return cell
            
        }
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

         if editingStyle == .delete{
             
             let person = Details[indexPath.row]
           ViewController.managedContext.delete(person)

                 do {
                         try! ViewController.managedContext.save()

                     }
                     catch let error as NSError {
                         print(error)
                     }

             fetchData()
             tableView.reloadData()
         }
                }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               index = indexPath.row
               
               if let viewController = storyboard?.instantiateViewController(identifier: "EditPage") as? EditPage {
                   viewController.index =  indexPath.row
                  //   viewController.
                   navigationController?.pushViewController(viewController, animated: true)
                   //print("hello")
               }
           }
    }


       
    
    

    


