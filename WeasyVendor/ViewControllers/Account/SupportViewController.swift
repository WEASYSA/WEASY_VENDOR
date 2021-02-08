//
//  SupportViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/16/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {
    @IBOutlet weak var messageContent: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func sendBtnAction(_ sender: Any) {
        sendBtn.isEnabled = false
        sendBtn.alpha = 0.5
        BranchController.branchController.support(completion: {check,msg in
            
            if check == 0 {
                self.view.makeToast(msg)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.dismiss(animated: true, completion: nil)
                    
                    
                })
            }
            else if check == 1{
                self.view.makeToast(msg)
                
            }
            else {
                self.showErrorAlert(with: msg)
            }
            
        }, msgContent: messageContent.text!)
        
    }
    
}
extension SupportViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > 0{
            sendBtn.isEnabled = true
            sendBtn.alpha = 1
        }
        else{
            sendBtn.isEnabled = false
            sendBtn.alpha = 0.5
            
        }
    }
}
