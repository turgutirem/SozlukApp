//
//  DataServices.swift
//  SozlukApp
//
//  Created by irem on 28.04.2022.
//

import Foundation
import Firebase
let BASE_URL = "https://sozlukkapp-default-rtdb.firebaseio.com/"


class DataService{
    
    static let dataService=DataService()//statik dataservice ekledik ve datservice classımızı çağırdık
    private var _BASE_REF = Database.database().reference(fromURL: "\(BASE_URL)")
    private var _ITEM_REF = Database.database().reference(fromURL: "\(BASE_URL)/items")//itemsleri ekledik böylece base üyelerinin altında itemslar olacak
    
    var BASE_REF : DatabaseReference{
        return _BASE_REF
    }
    
    var ITEM_REF : DatabaseReference{
        return _ITEM_REF
    }
    
}
