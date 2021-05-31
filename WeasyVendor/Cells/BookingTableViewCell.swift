//
//  BookingTableViewCell.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/19/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    @IBOutlet weak var numberOfReservationLabel: UILabel!
    @IBOutlet weak var numberOfPerson: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
//    @IBOutlet weak var vendorImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(booking: BookingTable){
        //        numberOfPerson.text = bookingb
        numberOfReservationLabel.text = "# \(booking.id)"
        userNameLabel.text = booking.name
        numberOfPerson.text = String(booking.numberofPeople)
        dateLabel.text = booking.date
        timeLabel.text = booking.time
//        vendorImage.sd_setImage(with: URL(string: booking.image), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
