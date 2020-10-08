//
//  LoginViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/6/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit
import Toast_Swift

class LoginViewController: UIViewController {
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var passwordErrorLbl: UILabel!
    @IBOutlet weak var userNameErrorLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpView()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: UITextField.textDidChangeNotification, object: nil)
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        UserController.userController.login(completion: {check, msg in
            
            if check == 0{
                self.performSegue(withIdentifier: "home", sender: self)
            }
            else if check == 1{
                self.view.makeToast(msg)
            }
            else {
                self.loginButton.isEnabled = true
                self.loginButton.alpha = 1
                self.noInternetDialog()
            }
            
        },  userName: userNameTF.text!, password: passwordTF.text!)
        
        
    }
    @objc private func textDidChange(_ notification: Notification) {
        enableButton()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension LoginViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF{
            passwordTF.becomeFirstResponder()
        }
            
        else{
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let (valid , text) = ValidTextField(textField: textField)
        
        if textField == userNameTF {
            userNameErrorLbl.isHidden = valid
            userNameErrorLbl.text = text
        }
        else if textField == passwordTF {
            passwordErrorLbl.isHidden = valid
            passwordErrorLbl.text = text
        }
        if valid {
            textField.layer.borderWidth = 0
            
        }
        else{
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.red.cgColor
        }
        
    }
}
extension LoginViewController{
    
    
    
    func enableButton(){
        var formIsValid = true
        
        for textField in textFields {
            // Validate Text Field
            let (valid,_) = ValidTextField(textField: textField)
            
            guard valid else {
                formIsValid = false
                break
            }
        }
        loginButton.isEnabled = formIsValid
        if (formIsValid){
            loginButton.alpha = 1
        }
        else {
            loginButton.alpha = 0.5
            
        }
    }
    func ValidTextField(textField : UITextField)->(Bool, String?) {
        if textField == userNameTF {
            if textField.text!.count == 0 {
                return (false ,NSLocalizedString("enter your user name",comment:"") )
            } else {
                return (true ,nil )
            }
        }
//        else if textField == passwordTF{
//            if textField.text!.count < 6 {
//                return (false ,NSLocalizedString("password should be greater than 6 digits",comment:"") )
//
//            }
//            else {
//                return (true ,nil )
//
//            }
//        }
        return (true ,nil )
    }
    
    
}
