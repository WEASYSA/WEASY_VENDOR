//
//  APIConnection.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/6/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation
import Alamofire

class APIConnection{
    static var apiConnection = APIConnection()
    
    
    func getConnection (completion: @escaping(Int,NSDictionary,String)-> (), link : String){
        
        
        Alamofire.request(link, method: .get, headers: Constants.HEADER).responseJSON { response in
            
            if let JSON = response.result.value  as? NSDictionary{
                let msg = JSON["msg"] as! String

                if let check = JSON["status_code"] as? Int{
                    if check == 200 {
                        if  let data = JSON["data"] as? NSDictionary{
                            completion(0, data , msg )
                        }
                        else{
                            completion(0, [:] , msg )
                            
                            //return msg
                        }
                    }
                    else {
                        completion(1, [:] , msg)
                        
                    }
                }
                
            }
            else {
                completion(2, [:],"noInternet")
            }
        }
    }
    func postConnection (completion: @escaping(Int,NSDictionary,String)-> (), link : String, param: Parameters ){
        
        print(param)
        
        Alamofire.request(link, method: .post, parameters: param, headers: Constants.HEADER).responseJSON { response in
            print(response.result.value)
            print(link)
            print(Constants.HEADER["token"])
            if let JSON = response.result.value  as? NSDictionary{
                print(JSON)
                let msg = JSON["msg"] as! String

                if let check = JSON["status_code"] as? Int{
                    if check == 200 {
                        if let data = JSON["data"] as? NSDictionary{
                        completion(0, data,msg )
                        }
                        else{
                            completion(0, [:],msg )

                        }
                    }
                    else{
                        completion(1, [:],msg)
                        
                    }
                }
                
            }
            else {
                completion(2, [:],"noInternet")
            }
        }
    }
   
   
}
