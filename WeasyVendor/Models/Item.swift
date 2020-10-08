//
//  Item.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/12/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class Item{
    var image = ""
    var name = ""
    var price = 0.0
    var isAvailable = false
    var id = 0
    var quantity = 1
    var note = ""
    var options = ""
    var size = ""
    init(){
        
    }
    
    init(with dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        id = dictionary["id"] as! Int
        
        image = dictionary["image_details"] as! String
        name = dictionary["name"] as! String
        price = dictionary["price"] as! Double
        isAvailable = dictionary["available"] as! Bool
    }
    init(withDetails dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        id = dictionary["id"] as! Int
        image = dictionary["image_details"] as! String
        name = dictionary["itemname"] as! String
        price = dictionary["total_item_price"] as! Double
        quantity = dictionary["quantity"] as! Int
        note = dictionary["note"] as! String
        options = dictionary["item_options"] as! String
        
        if let _size = dictionary["sizename"] as? String{
            size = _size

        }
      
    }
}
