//
//  SignUpVC.swift
//  SozlukApp
//
//  Created by irem on 28.04.2022.
//

import UIKit
import Firebase
import FirebaseFirestore
class SignUpVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        let pass = passwordText.text ?? ""
        let repeatPass = repeatPassword.text ?? ""
        let email = emailText.text ?? ""
        
        if pass.isEmpty || email.isEmpty || repeatPass != pass
        {
            Common.showAlert(title: "Check the information.", message: "Please, entry your password or email!", vc: self)
            
            return
        }
        createUser(email: email, password: pass)
    }

    
    func createUser(email: String, password:String){
        Auth.auth().createUser(withEmail: email, password: password){
            (Result,Error) in
            
            if Error != nil{
                Common.showAlert(title: "Warning!", message: Error?.localizedDescription ?? "User's not defined.", vc: self)
            }else{
               let def = Firestore.firestore()
                def.collection("Users").document().setData(["Name" : Auth.auth().currentUser?.email as Any])
                _=self.navigationController?.popToRootViewController(animated: true)
            }
            
        }
        
        
        
    }
    
    
    
}
