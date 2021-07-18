//
//  itemDetailsTableViewCell.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/16/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

class itemDetailsTableViewCell: UITableViewCell {
  
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var noteLable: UILabel!
    @IBOutlet weak var optionsLable: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        noteLable.sizeToFit()
        optionsLable.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(item: Item){
        quantityLbl.text = String(item.quantity) + NSLocalizedString(" items", comment: "")
        nameLbl.text = item.name
        priceLbl.text = String(item.price) + NSLocalizedString(" SAR", comment: "")
        noteLable.text = item.note
        optionsLable.text = item.size + item.options
        itemImageView.sd_setImage(with: URL(string: item.image), placeholderImage: UIImage(named: "placeholder.png"))

    }
}
