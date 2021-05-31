//
//  BranchController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/16/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import Foundation

class BranchController {
    
    static var branchController = BranchController()
    
    func getErnings(completion: @escaping(Int,Earnings,String)-> ()){
        APIConnection.apiConnection.postConnection(completion: {
            check, data, msg in
            print(data)
            var earnings = Earnings()
            if check == 0{
                earnings = Earnings(with: data["result"] as! NSDictionary as! [String : Any])
            }
            completion(check,earnings,msg)
        }, link: Constants.EARNINGS, param : [:])
    }
    
    func support(completion: @escaping(Int,String)-> (), msgContent: String){
        var param = ["message": msgContent]
        APIConnection.apiConnection.postConnection(completion: {
            check, data, msg in
            completion(check,msg)
        }, link: Constants.SUPPORT, param: param)
    }
    
    func getRuchTime(completion: @escaping(Int,String,String)-> ()){
        APIConnection.apiConnection.getConnection(completion: {
            check, data, msg in
            print(data)
            var status = "normal time"
            if let result = data["result"] as? NSDictionary{
                status = result["timer_status"] as! String
            }
            completion(check,status,msg)
        }, link: Constants.GET_RUCH_TIME)
    }
    
    func updateRushTime(completion: @escaping(Int,String)-> (), rushTime: String){
        print(rushTime)
        let param = ["timer_status": rushTime]
        APIConnection.apiConnection.postConnection(completion: {
            check, data, msg in
            completion(check,msg)
        }, link: Constants.UPDATE_RUCH_TIME, param: param)
    }
    
    func getDainIn(completion: @escaping(Int,Int,String)-> ()){
        APIConnection.apiConnection.getConnection(completion: {
            check, data, msg in
            print(data)
            var status = 1
            if let result = data["result"] as? NSDictionary{
                status = result["dnn_table"] as! Int
            }
            completion(check,status,msg)
        }, link: Constants.GET_DAIN_IN)
    }
    
    func updateDainIn(completion: @escaping(Int,String)-> (), dnn_table: Int){
        var param = ["dnn_table": dnn_table]
        APIConnection.apiConnection.postConnection(completion: {
            check, data, msg in
            completion(check,msg)
        }, link: Constants.DAIN_IN, param: param)
    }
    
    func updateBranchStatus(completion: @escaping(Int,String)-> (), branch_status: String){
        let param = ["branch_status": branch_status]
        APIConnection.apiConnection.postConnection(completion: {
            check, data, msg in
            completion(check,msg)
        }, link: Constants.vendor_branch_status, param: param)
    }
    
}
