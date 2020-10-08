//
//  User.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/6/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class User{
    var userName = ""
    var pssword = ""
    var token = ""
    var id = 0
    var name = ""
    
    init(){
        
    }
    
    init(with dictionary: [String: Any]?) {
          guard let dictionary = dictionary else { return }
               
          token = String (dictionary["token"] as! Int)
          id = dictionary["user_id"] as! Int
          name = dictionary["name"] as! String
          userName = dictionary["username"] as! String
    }
          
    
    
}
