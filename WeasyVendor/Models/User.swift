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
    var branchId = 0
    init(){
        
    }
    
    init(with dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        
        token = String (dictionary["token"] as! Int)
        
        if let _id = dictionary["user_id"] as? Int {
            id = _id
        }
        if let _branchId = dictionary["branch_id"] as? Int {
            branchId = _branchId
        }
        
        if let  _name = dictionary["name"] as? String {
            name = _name
        }
        
        if let _userName = dictionary["username"] as? String {
            userName = _userName
        }
        
    

    }
    
}
