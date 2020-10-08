//
//  ItemsViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/12/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit
import Toast_Swift
class ItemsViewController: UIViewController {
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    var items = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpView()
        getItems()
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
extension ItemsViewController{
    func getItems(){
        ItemsController.itemsController.getItems(completion: {
            check, items,msg in
            self.items = items
            self.itemsTableView.reloadData()
            
            if check == 1{
                self.view.makeToast(msg)
            }
            else if check == 2{
                self.noInternetDialog()
            }
            
            
            
        }
        )
    }
}
extension ItemsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ItemsTableViewCell
        cell.setData(item: items[indexPath.row], itemIndex: indexPath.row)
        cell.Delegate = self
        return cell
    }
    
    
}

extension ItemsViewController: ItemsTableViewDelegate{
    func changeAvailablilty(available: Bool, itemIndex: Int) {
        ItemsController.itemsController.changeAvailability(completion: {check, msg in
            
            if check == 0{
                self.view.makeToast(msg)
                self.items[itemIndex].isAvailable = !self.items[itemIndex].isAvailable
            }
            else if check == 1{
                self.view.makeToast(msg)
                self.itemsTableView.reloadData()
            }
            else {
                self.noInternetDialog()
                self.itemsTableView.reloadData()
                
            }
        }, itemId: self.items[itemIndex].id, isAvailable: available)
    }
    
    
}
