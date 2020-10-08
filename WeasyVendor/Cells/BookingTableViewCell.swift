//
//  BookingTableViewCell.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/19/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    @IBOutlet weak var numberOfPerson: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var vendorImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setData(booking: BookingTable){
//        numberOfPerson.text = bookingb
        numberOfPerson.text = String(booking.numberofPeople)
        dateLabel.text = booking.date
          vendorImage.sd_setImage(with: URL(string: booking.image), placeholderImage: UIImage(named: "placeholder.png"))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
