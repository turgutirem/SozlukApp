//
//  Common.swift
//  SozlukApp
//
//  Created by irem on 28.04.2022.
//

import Foundation
import UIKit
class Common: NSObject{
    
    class func showAlert(title: String,message: String, vc:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
