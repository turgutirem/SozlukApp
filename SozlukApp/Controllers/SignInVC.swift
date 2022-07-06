//
//  SignInVC.swift
//  SozlukApp
//
//  Created by irem on 28.04.2022.
//

import UIKit
import Firebase
class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        let pass = passwordText.text ?? ""
        let email = emailText.text ?? ""
        
        if pass.isEmpty || email.isEmpty{
            print("Please, entry your password or email!")
            
            return
        }
            
        Auth.auth().signIn(withEmail: email, password: pass){
            (Result,Error) in
            if Error != nil {
                print(Error?.localizedDescription ?? "Error")
            }else{
                self.tabBarController?.selectedIndex = 0
            }
        }
        
        
        
    }
    
  

}
