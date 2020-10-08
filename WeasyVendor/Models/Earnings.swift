//
//  Earnings.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/16/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class Earnings{
    var date = ""
    var day = ""
    var price = 0.0
    var totalOrders = 0
    var ordersCompleted = 0
    var ordersRejected = 0
    var totalCash = 0.0
    var totalCreditCard = 0.0
    
    init(){
        
    }
    
    init(with dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        date = dictionary["today_date"] as! String
        print(date)
        day = dictionary["day"] as! String
        price = dictionary["total_price"] as! Double
        totalOrders = dictionary["total_orders"] as! Int
        ordersCompleted = dictionary["orders_completed"] as! Int
        ordersRejected = dictionary["orders_rejected"] as! Int
        totalCreditCard = dictionary["total_credit_card_payment"] as! Double
        totalCash = dictionary["total_cash_payment"] as! Double
        
    }
}
