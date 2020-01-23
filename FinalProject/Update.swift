//
//  Update.swift
//  FinalProject
//
//  Created by MacStudent on 2020-01-23.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
import UIKit

class Update : UIViewController
{
    var  selectedCountry = ""

    @IBOutlet weak var nameLab: UITextField!
    @IBOutlet weak var genderLab: UITextField!
    @IBOutlet weak var latiLab: UITextField!
    @IBOutlet weak var longiLab: UITextField!
    @IBOutlet weak var birthLab: UITextField!
    @IBOutlet weak var imageLab: UIImageView!
    @IBOutlet weak var countryLab: UITextField!
    
     var Details:[Information] = []

         var index = 0
        @IBAction func saveButton(_ sender: Any)
        {
            let dateFormatter = DateFormatter()
                             dateFormatter.dateStyle = .short
                             dateFormatter.timeStyle = .none
                      
            updateRecord(det: Details[index], name: nameLab.text!, gender: genderLab.text!, country: countryLab.text!, date: dateFormatter.date(from: birthLab.text!)!, latitude: Double(latiLab.text!) as! Double, longitude: Double(longiLab.text!) as! Double)
                      
                      self.navigationController?.popToRootViewController(animated: true)
                      
                  }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            fetchData()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            nameLab.text = Details[index].name
                   genderLab.text = Details[index].gender
                   countryLab.text = Details[index].country
                   birthLab.text = dateFormatter.string(from: Details[index].dob)
                   latiLab.text = String(Details[index].latitude)
                   longiLab.text = String(Details[index].longitude)
        }
       
           
           func fetchData(){
           
               do{
                   Details = try ViewController.managedContext.fetch(Information.fetchRequest())
               }
                   //if error exists/catch it
               catch{
                   print(error)
               }
           }
    func updateRecord(det : Information, name:String, gender:String, country:String, date:Date, latitude:Double, longitude:Double){
                det.name = name
                det.gender = gender
                det.country = country
                det.dob = date
                det.latitude = latitude
                det.longitude = longitude
                saveContext()
           }
           
           func saveContext () {
               
               
            if ViewController.managedContext.hasChanges {
                   do {
                       try ViewController.managedContext.save()
                   } catch {
                       // Replace this implementation with code to handle the error appropriately.
                       // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                       let nserror = error as NSError
                       fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                   }
               }
           }

    }


