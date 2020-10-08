//
//  AccountViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/13/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class AccountViewController: UIViewController {
    
    @IBOutlet weak var dinerInSwitch: UISwitch!
    @IBOutlet weak var ruchTimeSwitch: UISwitch!
    
    @IBOutlet var btnStatus: UIButton!

    var arrStatus = ["open","busy","closed"]
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpView()
        getRushTime()
        getDainTime()
        
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        AppDelegate.defaults.set(nil, forKey: "token")
        UserController.userController.logout()
        
        self.performSegue(withIdentifier: "login", sender: self)
    }
    @IBAction func dinerinAction(_ sender: UISwitch) {
        var status = 1
        
        if sender.isOn {
            status = 1
        }
        else {
            status = 0
            
        }
        
        BranchController.branchController.updateDainIn(completion: {
            check, msg in
            if check == 0{
                self.view.makeToast(msg)
            }
            else if check == 1{
                self.dinerInSwitch.setOn(!(self.dinerInSwitch != nil), animated: false)
                self.view.makeToast(msg)
            }
            else {
                self.noInternetDialog()
                self.dinerInSwitch.setOn(!(self.dinerInSwitch != nil), animated: false)
            }
        }, dnn_table: status)
        
    }
    
    @IBAction func RuchTimeAction(_ sender: UISwitch) {
        var status = ""
        
        if sender.isOn {
            status = "rush time"
        }
        else {
            status = "normal time"
            
        }
        
        BranchController.branchController.updateRushTime(completion: {
            check, msg in
            if check == 0{
                self.view.makeToast(msg)
            }
            else if check == 1{
                self.ruchTimeSwitch.setOn(!(self.ruchTimeSwitch != nil), animated: false)
                self.view.makeToast(msg)
            }
            else {
                self.noInternetDialog()
                self.ruchTimeSwitch.setOn(!(self.ruchTimeSwitch != nil), animated: false)
            }
        }, rushTime: status)
        
    }
    
    func getRushTime(){
        BranchController.branchController.getRuchTime(completion: {
            check, status, msg in
            
            if check == 0{
                print(status)
                if status == "rush time"  {
                    self.ruchTimeSwitch.setOn(true, animated: false)
                }
                else {
                    self.ruchTimeSwitch.setOn(false, animated: false)
                }
                
            }
            else if check == 1{
                self.view.makeToast(msg)
                
            }
            else {
                self.noInternetDialog()
                
            }
        })
    }
    func getDainTime(){
        BranchController.branchController.getDainIn(completion: {
            check, status, msg in
            
            if check == 0{
                print(status)
                if status == 1 {
                    self.dinerInSwitch.setOn(true, animated: false)
                }
                else {
                    self.dinerInSwitch.setOn(false, animated: false)
                }
                
            }
            else if check == 1{
                self.view.makeToast(msg)
                
            }
            else {
                self.noInternetDialog()
                
            }
        })
    }
    
    @IBAction func btnChangeStatusAction(_ sender: UIButton) {
        ActionSheetMultipleStringPicker.show(withTitle: "Select Status", rows: [
            self.arrStatus], initialSelection: [self.index], doneBlock: {
                picker, indexes, values in
                
                if let index : Int = indexes![0] as? Int {
                    self.index = index
//                    self.getTrackScreenAPI()
                    
                    BranchController.branchController.updateBranchStatus(completion: {
                        check, msg in
                        if check == 0 {
                            self.view.makeToast(msg)
                            self.btnStatus.setTitle(self.arrStatus[self.index], for:.normal)
                        } else if check == 1{
                            self.view.makeToast(msg)
                        } else {
                            self.noInternetDialog()
                        }
                    }, branch_status: self.arrStatus[self.index])
                    
                }
                return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
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
