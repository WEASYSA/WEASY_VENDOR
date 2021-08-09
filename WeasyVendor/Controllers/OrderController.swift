//
//  OrderController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/12/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class OrderController{
    static var orderController = OrderController()
    
    func getOrders(completion: @escaping(Int,[Order],String)-> (),link: String){
        
        var orders = [Order]()
        APIConnection.apiConnection.postConnection(completion: {check, data, msg in
            
            if check == 0{
                if let result = data["result"] as? NSArray{
                    for i in 0..<result.count{
                        orders.append(Order(with: result[i] as! NSDictionary as! [String : Any]))
                    }
                }
            }
            completion(check, orders, msg)

        }, link: link, param: [:])
    }
    func getOrderDetauls(completion: @escaping(Int,Order,CarModel?,Int,String)-> (),orderID: String){
        
        var order = Order()
        var car: CarModel?
        APIConnection.apiConnection.getConnection(completion: {check, data, msg in
            
            print( Constants.ORDER_DETAILS + String(orderID))
            print( data)
              var timer = 0
            if check == 0{
                if let result = data["result"] as? NSArray{
                    for i in 0..<result.count{
                        order.items.append(Item(withDetails: result[i] as! NSDictionary as! [String : Any]))
                    }
                }
        
            }
            if let _timer = data["timer"] as? Int{
                timer = _timer
            }
            if let carDataDicationry = data["car_data"] as? NSDictionary {
                if carDataDicationry == [:] {
                    car = CarModel(with: nil)
                    completion(check, order,nil,timer, msg)

                }else {
                    car = CarModel(with: carDataDicationry as? [String : Any])
                    completion(check, order,car,timer, msg)

                }
            }
            
//            if let carData = data["car_data"] as? NSDictionary {
//                if let _plateNumber = carData["plateNum"] as? String {
//                    plateNumber = _plateNumber
//                }
//                if let _carBrand = carData["carBrand"] as? String {
//                    carBrand = _carBrand
//                }
//
//                if let _carModel = carData["carModel"] as? String {
//                    carModel = _carModel
//                }
//
//                if let _modelColor = carData["modelColor"] as? String {
//                    modelColor = _modelColor
//                }
//                if let _modelType = carData["modelType"] as? String {
//                    modelType = _modelType
//                }
//                if let _modelYear = carData["modelYear"] as? String {
//                    modelYear = _modelYear
//                }
//
//            }
     
            print(timer)
            
        }, link: Constants.ORDER_DETAILS + orderID)
    }
    func acceptOrders(completion: @escaping(Int,String)-> (),orderID: String){
        
        APIConnection.apiConnection.getConnection(completion: {check, data, msg in
            
            completion(check, msg)
            
        }, link: Constants.ACCEPT_ORDER + orderID)
    }
    func rejectOrders(completion: @escaping(Int,String)-> (),comment: String,orderID: String){
        var param = ["order_id": orderID,
                     "note": comment]
           
           APIConnection.apiConnection.postConnection(completion: {check, data, msg in
               
               completion(check, msg)
               
           }, link: Constants.REJECT_ORDER, param: param)
       }
    func confirmOrder(completion: @escaping(Int,String)-> (),orderID: String){
        
             
             APIConnection.apiConnection.getConnection(completion: {check, data, msg in
                 
                 completion(check, msg)
                 
             }, link: Constants.CONFIRM_ORDER + orderID)
         }
    func pickupOrder(completion: @escaping(Int,String)-> (),orderID: String){
          
               
               APIConnection.apiConnection.getConnection(completion: {check, data, msg in
                   
                   completion(check, msg)
                   
               }, link: Constants.READY_TO_UP_ORDER + orderID)
           }
    func PayOrder(completion: @escaping(Int,String)-> (),orderID: String){
        var param = ["order_id": orderID]
                 
                 APIConnection.apiConnection.postConnection(completion: {check, data, msg in
                     
                     completion(check, msg)
                     
                 }, link: Constants.PAY_ORDER ,param: param)
             }
    
    func orderPreparing(completion: @escaping(Int,String)-> (),orderID: String){
    
         
         APIConnection.apiConnection.getConnection(completion: {check, data, msg in
             
             completion(check, msg)
             
         }, link: Constants.PREPARING_ORDER + orderID)
    }
    func markAsDebtor(completion: @escaping(Int,String)-> (),orderID: String){
     
        var param = ["order_id": orderID]
          APIConnection.apiConnection.postConnection(completion: {check, data, msg in
              completion(check, msg)
              
          }, link: Constants.MARK_AS_DEBTOR, param: param)
     }
}
