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
        if let _date = dictionary["today_date"] as? String {
            date = _date
        }
        print(date)
        if let _day = dictionary["day"] as? String {
            day = _day
        }
        if let _price = dictionary["total_price"] as? Double {
            price = _price
        }
        if let _totalOrders = dictionary["total_orders"] as? Int {
            totalOrders = _totalOrders
        }
        if let _ordersCompleted = dictionary["orders_completed"] as? Int {
            ordersCompleted = _ordersCompleted
        }
        if let _ordersRejected = dictionary["orders_rejected"] as? Int {
            ordersRejected = _ordersRejected
        }
        if let _totalCreditCard = dictionary["total_credit_card_payment"] as? Double {
            totalCreditCard = _totalCreditCard
        }
        if let _totalCash = dictionary["total_cash_payment"] as? Double {
            totalCash = _totalCash
        }
    }
}
