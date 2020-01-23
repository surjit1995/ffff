//
//  EditPage.swift
//  FinalProject
//
//  Created by MacStudent on 2020-01-20.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
import UIKit

class EditPage : UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate{
   
    let imagePicker = UIImagePickerController()
   
     var index = 0
    
  var  selectedCountry = ""
    
    @IBOutlet weak var nametextfield: UITextField!
    @IBOutlet weak var gendertextfield: UITextField!
    @IBOutlet weak var datetextfield: UIDatePicker!
    @IBOutlet weak var latitudetextfield: UITextField!
    @IBOutlet weak var longitudetextfield: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countrytextfield: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
   
    //add button to add user image
    @IBAction func addButton(_ sender: UIButton) {
        imagePicker.allowsEditing = false
               imagePicker.sourceType = .photoLibrary
               
               present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage

            
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imagePicker.delegate = self
        
        UserDefaults.standard.set("", forKey: "country")
        
        countrytextfield.delegate = self
        countrytextfield.addTarget(self,action:#selecter(countryBtnPressed),for: .touchDown)
        //showDatePicker()
        
        //countrytextfield.delegate = self
        
        
        // Do any additional setup after loading the view.
        
    
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
   //function to select the country from the list
    
    
    

func textFieldDidBeginEditing(_ textField: UITextField) {
       if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CountryPickerViewController") as? CountryPickerViewController{
              
                  if let navigator = navigationController {
                      navigator.pushViewController(viewController, animated: true)
                  }
              }
       print("TextField did begin editing method called")
       self.view.endEditing(true)
   }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let g = UserDefaults.standard.string(forKey: "country")
        countrytextfield.text = g
        
    
    }
    
    
//    @IBAction func saveButton(_ sender: Any) {
//
//               let dateFormatter = DateFormatter()
//               dateFormatter.dateStyle = .short
//               dateFormatter.timeStyle = .none
//
//        insertRecord(name: nametextfield.text!, gender: gendertextfield.text!, latitude: Double( latitudetextfield.text!)!, longitude: Double(longitudetextfield.text!)!,country : countrytextfield.text!,image : Data(imageView.image)!, dob : dateFormatter.date(from: datepicker.text!)!)
//
//        self.navigationController?.popToRootViewController(animated: true)
//
//    }
    func insertRecord(name:String, gender:String, latitude:Double, longitude:Double, country : String, image : Data, dob : Date){
        let info = Information(context: ViewController.managedContext)
        info.name = name
        info.gender = gender
        info.latitude =   latitude
        info.longitude = longitude
        info.country = country
        info.image = image
        info.dob = dob
       
        try! ViewController.managedContext.save()
    }
    
    


}
    
        
