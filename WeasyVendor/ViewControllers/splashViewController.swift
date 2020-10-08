//
//  ViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 1/27/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

class splashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            print(AppDelegate.defaults.string(forKey: "token"))
            if AppDelegate.defaults.string(forKey: "token") != nil{
                AppDelegate.currentUser.token = AppDelegate.defaults.string(forKey: "token")!
                
                
                Constants.HEADER["token"] = AppDelegate.currentUser.token
                print(AppDelegate.currentUser.token)
                self.getUserData()
                //
                
            }
            else {
                //go to login"
                self.performSegue(withIdentifier: "login", sender: nil)
            }
            
            
        }
    }
    func getUserData(){
        UserController.userController.userData(completion: {
            check , msg in
            if check == 0 {
                self.performSegue(withIdentifier: "orders", sender: self)
            }
            else if check == 1{
                self.performSegue(withIdentifier: "login", sender: self)
                
            }
            else {
                self.noLoginInternetDialog()
            }
        }
        )
    }
    
    
    
}

