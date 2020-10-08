//
//  BookingTableViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/19/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

class BookingTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var bookings = [BookingTable]()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        tableView.dataSource = self
        getBookings()
        // Do any additional setup after loading the view.
    }
    @objc func refresh(){
        
        getBookings()
        
        
    }
    
    func getBookings(){
        BookingController.bookingController.getBookingList(completion: {
            check, bookings, msg in
            self.bookings = bookings
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            if check == 1{
                self.view.makeToast(msg)
            }
            else if check == 2{
                self.noInternetDialog()
                
            }
        })
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
    
}
extension BookingTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(bookings.count)
        return bookings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookingTableViewCell
        cell.setData(booking: bookings[indexPath.row])
        return cell
    }
}
