//
//  RejectionReasonViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/17/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

public protocol rejectOrderDelegate: class {
    func reject(status: Bool)
}

class RejectionReasonViewController: UIViewController {
    open weak var Delegate: rejectOrderDelegate?

    @IBOutlet weak var submitBtn: GradientView!
    @IBOutlet weak var reasonTextView: UITextView!
    
    var orderID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAction(_ sender: Any) {
        OrderController.orderController.rejectOrders(completion: {
            check, msg in
            if check == 0{
                self.Delegate?.reject(status: true)
                self.dismiss(animated: false, completion: nil)
            }
            else if check == 1{

                self.view.makeToast(msg)
            }
            else {
                self.showErrorAlert(with: msg)
            }
            
        }, comment: reasonTextView.text, orderID: orderID)
//        self.dismiss(animated: false, completion: nil)
//        self.Delegate?.reject(status: true)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrdersViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func cancelOrderAction(_ sender: Any) {
        self.Delegate?.reject(status: false)
        self.dismiss(animated: false, completion: nil)
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
extension RejectionReasonViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > 0{
            submitBtn.isEnabled = true
            submitBtn.alpha = 1
        }
        else{
            submitBtn.isEnabled = false
            submitBtn.alpha = 0.5
            
        }
    }
}

