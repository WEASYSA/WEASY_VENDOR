//
//  ItemsController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/12/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class ItemsController{
    static var itemsController = ItemsController()
    
    func getItems(completion: @escaping(Int,[Item],String)-> ()){
        var items = [Item]()
        APIConnection.apiConnection.postConnection(completion: {
            check, data, msg in
            if check == 0{
                let result = data["result"] as! NSArray
                for i in 0..<result.count{
                    items.append(Item(with: result[i] as! NSDictionary as! [String : Any]))
                }
            }
            completion(check, items,msg)
        }, link: Constants.ITEMS, param: [:])
    }
    
    func changeAvailability(completion: @escaping(Int,String)-> (), itemId: Int, isAvailable: Bool){
        var param = ["item_id":itemId,
                     "available": isAvailable] as [String : Any]
        APIConnection.init().postConnection(completion: {
            check, _,msg in
            completion(check,msg)
        }, link: Constants.CHANGE_ITEM_AVAILABLE, param: param)
    }

}
