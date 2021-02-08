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
            if check == 0 {
                self.bookings = bookings
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
            else if check == 1{
                self.view.makeToast(msg)
            }
            else {
                self.showErrorAlert(with: msg)
            }
        })
    }
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
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
