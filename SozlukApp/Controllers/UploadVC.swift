//
//  UploadVC.swift
//  SozlukApp
//
//  Created by irem on 28.04.2022.
//

import UIKit
import Firebase
class UploadVC: UIViewController {

    @IBOutlet weak var category: UISegmentedControl!
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        let title = titleTxt.text ?? ""
        let desc = descriptionTxt.text ?? ""
        let cat = category.titleForSegment(at: category.selectedSegmentIndex)
        
        let currentUser = Auth.auth().currentUser
        
        if currentUser == nil {
            
            Common.showAlert(title: "Warning!", message: "Please , Log in.", vc: self)
            
            return
        }
        
        let newItem: Dictionary<String, Any> = [ "title": title, "desc": desc, "type": cat, "email": currentUser?.email ]
        
       createNewItem(item: newItem)
    }
    
    func createNewItem(item: Dictionary<String,Any>) {
        
        let firebaseNewItem = DataService.dataService.ITEM_REF.childByAutoId()
        
        firebaseNewItem.setValue(item) { (error: Error?, ref: DatabaseReference) -> Void in
            
            if error == nil {
            
                self.tabBarController?.selectedIndex = 0
                self.titleTxt.text = ""
                self.descriptionTxt.text = ""
                print("saved.")
                
            }else {
                Common.showAlert(title: "Warning!", message: error?.localizedDescription ?? "Error!!!!", vc: self)
            }
            
        }
        
    }
}


