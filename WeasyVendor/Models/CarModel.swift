//
//  CarModel.swift
//  WeasyVendor
//
//  Created by Sherif on 17/07/2021.
//  Copyright © 2021 Amal Elgalant. All rights reserved.
//

import Foundation

class CarModel{
    
    var id: Int?
    var is_default: Int?
    var plateNum: String?
    var token = ""
    var carBrand = ""
    var carModel = ""
    var modelColor = ""
    var modelType = ""
    var modelYear = ""
    
    init(with dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        if let _id = dictionary["id"] as? Int{
            id = _id
        }
        if let _is_default = dictionary["is_default"] as? Int{
            is_default = _is_default
        }
        
        if let _plateNum = dictionary["plateNum"] as? String{
            plateNum = _plateNum
        }
        
        if let _token = dictionary["token"] as? String{
            token = _token
        }
        
        if let _carBrand = dictionary["carBrand"] as? String{
            carBrand = _carBrand
        }
        
        if let _carModel = dictionary["carModel"] as? String{
            carModel = _carModel
        }
        
        if let _modelColor = dictionary["modelColor"] as? String{
            modelColor = _modelColor
        }
        
        if let _modelType = dictionary["modelType"] as? String{
            modelType = _modelType
        }
        
        if let _modelYear = dictionary["modelYear"] as? String{
            modelYear = _modelYear
        }
        
    }
}
