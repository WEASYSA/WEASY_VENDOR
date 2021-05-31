//
//  Order.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/12/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class Order{
    var name = ""
    var time = ""
    var status = ""
    var price = 0.0
    var user = User()
    var timer = 0
    var number = ""
    var id  = 0
    var items = [Item]()
    var payment = "cash"
    var numberofPeople = 0
    var isPaid = false
    init(){
        
    }
    
    init(with dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        
        number = String(dictionary["id"] as! Int)
        if let _price = dictionary["total_price"] as? String{
            price = Double(_price)!
        }
        else if let  _price = dictionary["total_price"] as? Double{
            price = _price
        }
        if let _status = dictionary["status"] as? String {
            status = _status
        }
        if let _isPaid = dictionary["paid_money"] as? Bool {
            isPaid = _isPaid
        }
        if let _username = dictionary["customername"] as? String {
            user.name = _username
        }
        if let _time = dictionary["ordered_at"] as? String {
            time = _time
        }
        if let _payment = dictionary["payment_type"] as? String {
            payment = _payment
        }
        if let _numberofPeople = dictionary["num_of_people"] as? Int {
            numberofPeople = _numberofPeople
        }
        if let _isPaid = dictionary["paid_money"] as? Bool {
            isPaid = _isPaid
        }
    }
    
}
