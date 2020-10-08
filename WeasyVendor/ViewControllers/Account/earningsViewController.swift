//
//  earningsViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/14/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

class earningsViewController: UIViewController {
    
    @IBOutlet weak var totalCreditLbl: UILabel!
    @IBOutlet weak var totalCashLbl: UILabel!
    @IBOutlet weak var ordersRejectedLbl: UILabel!
    @IBOutlet weak var ordersCompletedLbl: UILabel!
    @IBOutlet weak var totalOrdersLbl: UILabel!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        getData()
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
    
    func getData(){
        BranchController.branchController.getErnings(completion: {
            check , earnings, msg in
            
            if check == 0{
                print(earnings.date)
                self.dateLbl.text = earnings.date
                self.dayLbl.text = earnings.day
                self.totalOrdersLbl.text = String (earnings.totalOrders)
                self.ordersCompletedLbl.text = String (earnings.ordersCompleted)
                self.ordersRejectedLbl.text = String (earnings.ordersRejected)
                self.totalCashLbl.text = String (earnings.totalCash)
                self.totalCreditLbl.text = String (earnings.totalCreditCard)
                self.moneyLbl.text = String (earnings.price)
                
                
                
            }
            else if check == 1{
                self.view.makeToast(msg)
            }
            else {
                self.noInternetDialog()
            }
        })
    }
    
}
