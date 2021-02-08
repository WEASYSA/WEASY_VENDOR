//
//  OrdersViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/12/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit
import SwipeCellKit

class OrdersViewController: UIViewController {
    @IBOutlet weak var ordersTableView: UITableView!
    
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var pendingBtn: UIButton!
    
    var orders = [Order]()
    
    let refreshControl = UIRefreshControl()
    
    var link = Constants.PENDING_ORDERS
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpView()
        getOrders()
    }
    
    @IBAction func tableReservationAction(_ sender: Any) {
        self.performSegue(withIdentifier: "booking_list", sender: self)
    }
    
    @IBAction func panding_allBtnsAction(_ sender: UIButton) {
        if sender.restorationIdentifier == "pending"{
            sender.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
            allBtn.backgroundColor = UIColor.lightGray
            link = Constants.PENDING_ORDERS
            getOrders()
            
        }
        else{
            allBtn.backgroundColor = UIColor(red: 241/255, green: 180/255, blue: 0/255, alpha: 1)
            
            pendingBtn.backgroundColor = UIColor.lightGray
            link = Constants.ALL_ORDERS
            getOrders()
            
        }
    }
    @objc func refresh(){
        
        //         getBookingHistory()
        getOrders()
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "order_details"{
            let dVC = segue.destination as! OrderDetailsViewController
            dVC.order = orders[selectedIndex]
        }
        
    }
    
    @IBAction func itemsPageClicked(_ sender: Any) {
        self.openItemsPage()
    }
    @IBAction func accountPageClicked(_ sender: Any) {
        self.openContactPage()
    }
    
}
extension OrdersViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return orders.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ordersTableViewCell
        cell.setData(order: orders[indexPath.section])
        if link == Constants.PENDING_ORDERS {
            
            //        cell.delegate = self
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.section
        DispatchQueue.main.async {
            
            self.performSegue(withIdentifier: "order_details", sender: self)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    //    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
    //        if link == Constants.PENDING_ORDERS {
    //         guard orientation == .right else { return nil }
    //
    //         let debetAction = SwipeAction(style: .destructive, title: "") { action, indexPath in
    //             // handle action by updating model with deletion
    //
    //
    //             let refreshAlert = UIAlertController(title: NSLocalizedString("Debtor!",comment:""), message:  NSLocalizedString("Are you sure?",comment:""), preferredStyle: UIAlertController.Style.alert)
    //
    //             refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("OK",comment:""), style: .default, handler: { (action: UIAlertAction!) in
    //                OrderController.orderController.markAsDebtor(completion: {
    //                    check, msg in
    //                    if check == 0{
    //                        self.orders.remove(at: indexPath.section)
    //                              let indexSet = IndexSet(arrayLiteral: indexPath.section)
    //                               self.ordersTableView.deleteSections(indexSet, with: .fade)
    ////                        self.ordersTableView.dele([indexPath.section], with: .fade)
    //                    }
    //                    else if check == 1{
    //                                             self.view.makeToast(msg)
    //                                         }
    //                                         else{
    //                                             self.noInternetDialog()
    //                                         }
    //                }, orderID: self.orders[indexPath.row].number)
    //
    ////                 OrderController.orderController.removeFromCart(completion: { check,msg in
    ////
    ////                     if check == 0{
    ////                         self.view.makeToast(msg)
    ////                         AppDelegate.currentOrder.totalItems = AppDelegate.currentOrder.totalItems -                          AppDelegate.currentOrder.meals[indexPath.row].quantity
    ////
    ////                         AppDelegate.currentOrder.price =                          AppDelegate.currentOrder.price - AppDelegate.currentOrder.meals[indexPath.row].price
    ////
    ////                         self.totalPrice.text = String(AppDelegate.currentOrder.price)
    ////                         self.numberOfItems.text = String(AppDelegate.currentOrder.totalItems)
    ////                         AppDelegate.currentUser.itemsInCart = AppDelegate.currentOrder.totalItems
    ////
    ////                         AppDelegate.currentOrder.meals.remove(at: indexPath.row)
    ////                         self.tableView.deleteRows(at: [indexPath], with: .fade)
    ////                         if AppDelegate.currentOrder.meals.count == 0{
    ////
    ////                             self.navigationController?.popViewController(animated: true)
    ////                         }
    ////
    ////                     }
    ////                     else if check == 1{
    ////                         self.view.makeToast(msg)
    ////                     }
    ////                     else{
    ////                         self.noInternetDialog()
    ////                     }
    ////
    ////                 }, itemID: AppDelegate.currentOrder.meals[indexPath.row].id)
    ////
    //
    //             }))
    //             refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Cancel",comment:""), style: .cancel, handler: { (action: UIAlertAction!) in
    //
    //
    //             }))
    //
    //             self.present(refreshAlert, animated: true)
    //
    //
    //
    //
    //
    //         }
    //
    //         //           deleteAction.image = UIImage(named: "remov")
    //         debetAction.backgroundColor = .white
    //         debetAction.title = NSLocalizedString("mark as debtor",comment:"")
    //         debetAction.textColor = .red
    //
    //         return [debetAction]
    //        }
    //        else{
    //            return []
    //        }
    //     }
}
extension OrdersViewController{
    func getOrders( ){
        OrderController.orderController.getOrders(completion: {check, orders, msg in
                                                    
                                                    if check == 0 {
                                                        self.orders = orders
                                                        self.refreshControl.endRefreshing()
                                                        self.ordersTableView.reloadData()                                                        
                                                    }
                                                    
                                                    else if check == 1{
                                                        self.view.makeToast(msg)
                                                    }
                                                    else {
                                                        self.showErrorAlert(with: msg)
                                                    }},link: link)
    }
}
