//
//  ordersTableViewCell.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/12/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit
import SwipeCellKit

class ordersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var customerNameLbl: UILabel!
    @IBOutlet weak var statusBtn: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var orderNumberLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setData(order: Order){
        timeLbl.text = order.time
        customerNameLbl.text = order.user.name
        priceLbl.text = String (order.priceWithoutFees) + NSLocalizedString("SAR", comment: "")
        orderNumberLbl.text = order.number
        if order.status != ""{
            statusBtn.setTitle( NSLocalizedString(order.status, comment: ""), for: .normal)
        }
        else{
            statusBtn.setTitle(NSLocalizedString("Waiting", comment: ""), for: .normal)
        }
    }
    
}
