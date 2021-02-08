//
//  UIViewControllerExtenstions.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/6/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

extension UIViewController{
    
    //check email validation
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func setUpView(){
        backUsingSWip()
        clossKeyBoard()
        AppDelegate.currentViewContoller = self
        
        //set navigation title color "white"
    }
    
    
    
    @objc func backButtonClicked(){
        // move to menu
        self.navigationController?.popViewController(animated: true)
    }
    
    func backUsingSWip(){
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    func clossKeyBoard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
        
    func showErrorAlert(with message: String){
        let refreshAlert = UIAlertController(title: "Error!".localized, message: message, preferredStyle: .alert)
        refreshAlert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: { (action: UIAlertAction!) in
        }))
        present(refreshAlert, animated: true)
    }
    
    func noLoginInternetDialog(){
        
        let refreshAlert = UIAlertController(title: "OK", message: "No Internet Connection".localized, preferredStyle: .alert)
        refreshAlert.addAction(UIAlertAction(title:NSLocalizedString( "close Weasy",comment:""), style: .default, handler: { (action: UIAlertAction!) in
            exit(0);
        }))
        present(refreshAlert, animated: true)
 
    }
    //    func checkValidPhonNumber(Phone:String  )->Bool{
    //        do {
    //            let phoneNumberKit = PhoneNumberKit()
    //            let phoneNumber = try phoneNumberKit.parse(Phone)
    //
    //            return true
    //
    //        }
    //        catch {
    //            return false
    //
    //        }
    //    }
    
    
    func openOrdersPage(){
        let vc = OrdersViewController() //change this to your class name
        self.present(vc, animated: true, completion: nil)
    }
    func openItemsPage(){
        self.performSegue(withIdentifier: "items", sender: self)
        
    }
    func openContactPage(){
        
    }
    
    
}
