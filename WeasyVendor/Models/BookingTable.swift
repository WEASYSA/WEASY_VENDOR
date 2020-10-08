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
    var numberofPeople = 1
    var image = ""
    var id = 0
    
    init(){
        
    }
    init(with dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        
        id = dictionary["id"] as! Int
        numberofPeople = dictionary["num_of_people"] as! Int
        image = dictionary["branchlogo"] as! String 
        let _date = dictionary["date"] as! String
        
        let _time = dictionary["time"] as! String
        date = _date + " " + _time
        
        
        
        
    }
}
