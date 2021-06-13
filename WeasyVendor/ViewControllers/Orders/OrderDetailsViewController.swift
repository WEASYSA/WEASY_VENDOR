//
//  ItemDetailsViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/16/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

class OrderDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var timerStackView: UIStackView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var orderNumberLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var customerNameLbl: UILabel!
    @IBOutlet weak var statusStackView: UIStackView!
    @IBOutlet weak var acceptOrderBtn: UIButton!
    @IBOutlet weak var rejectBtn: UIButton!
    @IBOutlet weak var numberOfPeopleLbl: UILabel!
    @IBOutlet weak var paymentTypeLbl: UILabel!
    @IBOutlet weak var numberOfPersonStack: UIStackView!
    @IBOutlet weak var acceptRejectStackView: UIStackView!
    @IBOutlet weak var rejectedLbl: UILabel!
    @IBOutlet weak var acceptedBtn: UIButton!
    @IBOutlet weak var readyToPickupBtn: UIButton!
    @IBOutlet weak var completedBtn: UIButton!
    @IBOutlet weak var readyToPickupStack: UIStackView!
    @IBOutlet weak var completedStack: UIStackView!
    @IBOutlet weak var payBtn: UIButton!
//    @IBOutlet weak var startPreparingBtn: UIButton!

    var timer = Timer()
    var timeLeft: TimeInterval = 0
    var endTime: Date?
    var order = Order()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        maindetails()
        let readyToPickupTap = UITapGestureRecognizer(target: self, action: #selector(readyToPickupTaped))
        readyToPickupStack.addGestureRecognizer(readyToPickupTap)
        let completTap = UITapGestureRecognizer(target: self, action:  #selector(completTaped))
        completedStack.addGestureRecognizer(completTap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getOrderDetails()
    }
    
    @IBAction func startPreparingAction(_ sender: Any) {
        OrderController.orderController.orderPreparing(completion: {[weak self]
            check ,msg in
            guard let self = self else {return}
            if check == 0{
//                self.startPreparingBtn.isHidden = true
                if self.order.payment == "cash"{
                    self.payBtn.isHidden = false
                }
                else {
                    self.payBtn.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
                    self.payBtn.isEnabled = false
                   self.payBtn.isHidden = false
                }
                self.timerStackView.isHidden = false
                self.setupCounter()
                self.statusStackView.isHidden = false
                self.acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
            }
            else if check == 1{
                self.view.makeToast(msg)
            }
            else {
                self.showErrorAlert(with: msg)
            }
        }, orderID: self.order.number)
    }
    
    @IBAction func payAction(_ sender: Any) {

        OrderController.orderController.PayOrder(completion: {[weak self]
            check ,msg in
            guard let self = self else {return}
            if check == 0{
                self.order.isPaid = true
                self.payBtn.isEnabled = false
                self.payBtn.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
            }
            else if check == 1{
                self.view.makeToast(msg)
            }
            else {
                self.showErrorAlert(with: msg)
            }
        }, orderID: self.order.number)
    }
    
    func startPreparing() {
        OrderController.orderController.orderPreparing(completion: {[weak self]
            check ,msg in
            guard let self = self else {return}
            if check == 0{
                //                self.startPreparingBtn.isHidden = true
                if self.order.payment == "cash" || self.order.payment == "points"{
                    self.payBtn.isHidden = false
                }else {
                    self.payBtn.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
                    self.payBtn.isEnabled = false
                    self.payBtn.isHidden = false
                }
                self.timerStackView.isHidden = false
                self.setupCounter()
                
                self.statusStackView.isHidden = false
                self.acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
            }
            
            else if check == 1{
                self.view.makeToast(msg)
            }
            else {
                self.showErrorAlert(with: msg)
            }
        }, orderID: self.order.number)
    }
    
    @IBAction func acceptOrderAction(_ sender: Any) {
        self.acceptOrderBtn.isEnabled = false
        self.rejectBtn.isEnabled = false
        self.acceptOrderBtn.alpha = 0.5
        self.rejectBtn.alpha = 0.5
        self.acceptRejectStackView.isHidden = true
        self.statusStackView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
        }

        OrderController.orderController.acceptOrders(completion: {[weak self]
            check, msg in
            guard let self = self else {return}
            if check == 0 {
                //                                self.statusStackView.isHidden = false
//                self.acceptRejectStackView.isHidden = true
                self.timerStackView.isHidden = false
//                self.statusStackView.isHidden = false
//                self.acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                self.setupCounter()
                self.startPreparing()
                
                
//                self.startPreparingBtn.isEnabled = true
//                self.startPreparingBtn.isHidden = false
                //                self.acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                
            }
            else if check == 1 {
                self.acceptOrderBtn.isEnabled = true
                self.rejectBtn.isEnabled = true
                self.acceptOrderBtn.alpha = 1
                self.rejectBtn.alpha = 1
                self.view.makeToast(msg)
            }
            else {
                self.acceptOrderBtn.isEnabled = true
                self.rejectBtn.isEnabled = true
                self.acceptOrderBtn.alpha = 1
                self.rejectBtn.alpha = 1
                self.showErrorAlert(with: msg)
            }
            
        }, orderID: self.order.number)
        
        
    }
    @IBAction func rejectOrderAction(_ sender: Any) {
        self.acceptOrderBtn.isEnabled = false
        self.rejectBtn.isEnabled = false
        self.acceptOrderBtn.alpha = 0.5
        self.rejectBtn.alpha = 0.5
        let rejectVC = self.storyboard?.instantiateViewController(withIdentifier: "reject") as! RejectionReasonViewController
        rejectVC.orderID = order.number
        rejectVC.Delegate = self
        present(rejectVC, animated: false, completion: nil)
        
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.performSegue(withIdentifier: "orders", sender: self)
        
    }
    @objc func completTaped(){
        let confirmVC = self.storyboard?.instantiateViewController(withIdentifier: "confirm_complete") as! ConfirmCompleteViewController
        confirmVC.Delegate = self
        present(confirmVC, animated: false, completion: nil)
        
    }
    
    @objc func readyToPickupTaped(){
        //"ready to pickup"
        let confirmVC = self.storyboard?.instantiateViewController(withIdentifier: "confirm_ready_to_up") as! ConfirmReadyToPickupViewController
        confirmVC.Delegate = self
        present(confirmVC, animated: false, completion: nil)
    }
    
    func stopTimer(){
        timer.invalidate()
        //                timer = nil
    }
    
    func setupCounter (){
        print(timeLeft)
        print(timeLeft.time)
        
        timerLbl.text = timeLeft.time
        print( timeLbl.text)
        
        endTime = Date().addingTimeInterval(timeLeft)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if timeLeft > 0 {
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
            timerLbl.text = timeLeft.time
            
        } else {
//            self.order.status = "ready to pickup"
            acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
//            readyToPickupBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
//            readyToPickupStack.isUserInteractionEnabled = false
            completedStack.isUserInteractionEnabled = true
            self.timerStackView.isHidden = false
            timerLbl.text = timeLeft.time
            timer.invalidate()
        }
    }
    
}

extension OrderDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return order.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! itemDetailsTableViewCell
        cell.setData(item: order.items[indexPath.section])
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}


extension OrderDetailsViewController{
    
    func getOrderDetails(){
        OrderController.orderController.getOrderDetauls(completion: {[weak self]
            check, order,timer, msg in
            guard let self = self else {return}
            self.order.items = order.items
            print( self.order.items)
            self.tableView.reloadData()
            if check == 0{
                self.timeLeft = TimeInterval(timer)
                print(self.timeLeft)
                print(timer)
                
                if self.order.status == "order placed" || (self.order.status == "payment done" && (self.order.payment == "online" || self.order.payment == "points")) {
                    self.setupCounter()
                }
                else {
                    self.stopTimer()
                }
            }
            else if check == 1{
                self.view.makeToast(msg)
            }
            else {
                self.showErrorAlert(with: msg)
            }
        }, orderID: self.order.number)
    }
    
    func maindetails(){
        timeLbl.text = order.time
        priceLbl.text = String(order.priceWithoutFees) + NSLocalizedString("SAR", comment: "")
        orderNumberLbl.text = String(order.number)
        timeLbl.text = order.time
        paymentTypeLbl.text = NSLocalizedString(order.payment, comment: "") 
        
        if order.numberofPeople == 0 {
            numberOfPersonStack.isHidden = true
        }
        else {
            numberOfPersonStack.isHidden = false
            numberOfPeopleLbl.text = String(order.numberofPeople)
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65.0
        
        if order.status != "" && order.status != "declined" {
            payBtn.isHidden = false
          
            if order.isPaid || self.order.payment != "cash"{
                payBtn.isEnabled = false
                payBtn.setTitle(NSLocalizedString("Done", comment: ""), for: .normal)
            }
            else {
                payBtn.isEnabled = true
                payBtn.setTitle(NSLocalizedString("Pay", comment: ""), for: .normal)
                
            }
        }
        else {
            payBtn.isHidden = true
        }
        
        if order.status == ""{
            acceptRejectStackView.isHidden = false
            statusStackView.isHidden = true
            rejectedLbl.isHidden = true
        }
        else if order.status == "declined" {
            acceptRejectStackView.isHidden = true
            statusStackView.isHidden = true
            rejectedLbl.isHidden = false
            
        }
        else {
            acceptRejectStackView.isHidden = true
            rejectedLbl.isHidden = true
            if order.status == "order placed" || (self.order.status == "payment done" && (self.order.payment == "online" || self.order.payment == "points")){
//                self.startPreparingBtn.isHidden = false
                self.timerStackView.isHidden = false
                self.setupCounter()
            }else if order.status == "preparing"{
                acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                readyToPickupStack.isUserInteractionEnabled = true
                statusStackView.isHidden = false
//                self.startPreparingBtn.isHidden = true
                self.timerStackView.isHidden = false
                self.setupCounter()
                completedStack.isUserInteractionEnabled = false
            }
            else if order.status == "ready to pickup"{
                acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                readyToPickupBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                readyToPickupStack.isUserInteractionEnabled = false
                completedStack.isUserInteractionEnabled = true
//                self.startPreparingBtn.isHidden = true
                self.statusStackView.isHidden = false

                self.timerStackView.isHidden = false
                
            }
            else if order.status == "completed"{
//                self.startPreparingBtn.isHidden = true
                acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                readyToPickupBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                completedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                readyToPickupStack.isUserInteractionEnabled = false
                completedStack.isUserInteractionEnabled = false
                self.timerStackView.isHidden = false
                self.statusStackView.isHidden = false

            }
        }
    }
}

extension OrderDetailsViewController: rejectOrderDelegate{
    func reject(status: Bool) {
        if status {
            acceptRejectStackView.isHidden = true
            statusStackView.isHidden = true
            rejectedLbl.isHidden = false
            self.order.status = NSLocalizedString("declined", comment: "")
        }
        else {
            self.acceptOrderBtn.isEnabled = true
            self.rejectBtn.isEnabled = true
            self.acceptOrderBtn.alpha = 1
            self.rejectBtn.alpha = 1
        }
    }
}

extension OrderDetailsViewController: ConfirmReadyToPickupDelegate{
    func confirmReady(){
        OrderController.orderController.pickupOrder(completion: { [weak self] check, msg in
            guard let self = self else {return}
            if check == 0{
                self.order.status = NSLocalizedString("ready to pickup", comment: "")
                self.acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                self.readyToPickupBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                self.readyToPickupStack.isUserInteractionEnabled = false
                self.completedStack.isUserInteractionEnabled = true
                self.timeLeft = 0
            }
            else if check == 1{
                self.view.makeToast(msg)
            }
            else {
                self.showErrorAlert(with: msg)
            }
            
        }, orderID: order.number)
    }
}

extension OrderDetailsViewController: ConfirmCompleteDelegate{
    func confirmComplete() {
        OrderController.orderController.confirmOrder(completion: { [weak self] check, msg in
            guard let self = self else {return}
            if check == 0{
                self.order.status = NSLocalizedString("completed", comment: "")
                self.acceptedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                self.readyToPickupBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                self.completedBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
                self.readyToPickupStack.isUserInteractionEnabled = false
                self.completedStack.isUserInteractionEnabled = false
                self.timeLeft = 0
                
            }
            else if check == 1{
                self.view.makeToast(msg)
            }
            else {
                self.showErrorAlert(with: msg)
            }
            
        }, orderID: order.number)
    }
}
