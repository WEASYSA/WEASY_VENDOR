//
//  BookingController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/19/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class BookingController {
    static var bookingController = BookingController()
    
    func getBookingList(completion: @escaping(Int,[BookingTable],String)-> ()){
        
        var bookings = [BookingTable]()
        
       print(Constants.BOOKING_TABLE)
        APIConnection.apiConnection.getConnection(completion: {check, data, msg in
            print(data)

            if let BookingArray = data["result"] as? NSArray{
                for i in 0..<BookingArray.count{
                    bookings.append(BookingTable(with: BookingArray[i] as! NSDictionary as! [String: Any]))
                }
            }
            completion(check,bookings,msg)
            
            
        }, link: Constants.BOOKING_TABLE)
        
        
    }

}
