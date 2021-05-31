//
//  Booking.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/19/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class BookingTable {
    var date = ""
    var time = ""
    var numberofPeople = 1
    var image = ""
    var id = 0
    var name = ""
    var branchName = ""
    var paymentMethod = ""
    var phone = ""
    
    init(){
        
    }
    
    init(with dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        
        if let _id = dictionary["id"] as? Int {
            id = _id
        }
        if let _numberofPeople = dictionary["num_of_people"] as? Int {
            numberofPeople = _numberofPeople
        }
        if let _image = dictionary["branchlogo"] as? String {
            image = _image
        }
        
        if let _date = dictionary["date"] as? String {
            date = _date
        }
        
        if let _time = dictionary["time"] as? String {
            time = _time
        }
        
        if let _name = dictionary["name"] as? String {
            name = _name
        }
 
        if let _branchName = dictionary["branch_name"] as? String {
            branchName = _branchName
        }
        
        if let _paymentMethod = dictionary["payment_method"] as? String {
            paymentMethod = _paymentMethod
        }
        
        if let _phone = dictionary["phone"] as? String {
            phone = _phone
        }
        
    }
}
