//
//  UserController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/6/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class UserController{
    static var userController = UserController()
    
    
    func login(completion: @escaping(Int,String)-> (), userName: String, password: String){
        print(AppDelegate.userToken)
        let param = ["username": userName,
                     "password": password,
                     "device_token": AppDelegate.userToken]
        
        APIConnection.apiConnection.postConnection(completion: { check, data, msg in
            if check == 0{
                let result = data["result"] as! NSDictionary
                AppDelegate.currentUser = User(with: result as! [String : Any])
                print( AppDelegate.currentUser.token)
                AppDelegate.defaults.set(AppDelegate.currentUser.token, forKey: "token")
                Constants.HEADER["token"] = AppDelegate.currentUser.token
            }
            completion(check,msg)
            
        }, link: Constants.LOGIN, param: param)
    }
   
    func addToken(branchId:String){
        let param = ["fcm_token": AppDelegate.userToken,
                     "device_type": "ios",
                     "user_type": "vendor",
                     "branch_id": branchId
        ]
        APIConnection.apiConnection.postConnection(completion: {
            check, data,msg  in
            AppDelegate.defaults.set( AppDelegate.userToken, forKey: "device_token")
        }, link: Constants.ADD_TOKEN, param: param)
    }
    
    
    func logoutAndRemoveToken(){
        let param = ["fcm_token":AppDelegate.userToken,
                     "device_type": "ios",
                     "user_type" : "vendor"
        ]
        APIConnection.apiConnection.postConnection(completion: {
            check, data,msg  in
        }, link: Constants.LOGOUT, param: param)
    }

    func userData(completion: @escaping(Int,String)-> ()){
        APIConnection.apiConnection.postConnection(completion: { check, data, msg in
            if check == 0{
                let result = data["result"] as! NSDictionary
                AppDelegate.currentUser = User(with: result as! [String : Any])
            }
            completion(check,msg)
        }, link: Constants.USER_DATA, param: [:])
    }
    
    
    
}
