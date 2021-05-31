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
        if let _id = dictionary["id"] as? Int {
            id = _id
        }
        if let _image = dictionary["image_details"] as? String {
            image = _image
        }
        if let _name = dictionary["name"] as? String {
            name = _name
        }
        if let _price = dictionary["price"] as? Double {
            price = _price
        }
        if let _isAvailable = dictionary["available"] as? Bool {
            isAvailable = _isAvailable
        }
    }
    
    init(withDetails dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        if let _id = dictionary["id"] as? Int {
            id = _id
        }
        if let _image = dictionary["image_details"] as? String {
            image = _image
        }
        if let _name = dictionary["itemname"] as? String {
            name = _name
        }
        if let _price = dictionary["total_item_price"] as? Double {
            price = _price
        }
        if let _quantity = dictionary["quantity"] as? Int {
            quantity = _quantity
        }
        if let _note = dictionary["note"] as? String {
            note = _note
        }
        if let _options = dictionary["item_options"] as? String {
            options = _options
        }        
        if let _size = dictionary["sizename"] as? String{
            size = _size
        }
    }
}
