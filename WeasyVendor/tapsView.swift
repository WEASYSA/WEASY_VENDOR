//
//  tapsView.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 1/27/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

class tapsView: UIView {
    @IBOutlet weak var ordersBtn: UIButton!
    @IBOutlet weak var itemsBtn: UIButton!

    @IBOutlet weak var contentView: UIStackView!
    @IBOutlet weak var accountBtn: UIButton!
  
    
    
    override init(frame: CGRect) { // for using CustomView in code
           super.init(frame: frame)
           commonInit()
       }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
//       required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
//           super.init(coder: aDecoder)
//           commonInit()
//       }

       private func commonInit() {
           Bundle.main.loadNibNamed("customButton", owner: self, options: nil)
           addSubview(contentView)
           contentView.frame = self.bounds
           contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
       }
    
    
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        
//    }
    
//    required init(coder : NSCoder) {
//        super.init(coder: coder)
//        distribution = .fill
//        alignment = .fill
//        if let nibView = Bundle.main.loadNibNamed("tapsView", owner: self, options: nil)?.first as? UIStackView {
//                       addArrangedSubview(nibView)
//                   }
//    }



    
//    @IBAction func ordersBtnAction(_ sender: Any) {
//        let titleColor = UIColor(red: 245/255, green: 128/255, blue: 0/255, alpha: 1)
//        ordersBtn.setTitleColor(titleColor, for: .normal)
//        itemsBtn.setTitleColor(.black, for: .normal)
//        accountBtn.setTitleColor(.black, for: .normal)
//
//        let vc = OrdersViewController() //change this to your class name
//        AppDelegate.currentViewContoller.present(vc, animated: true, completion: nil)
//
//    }
//    @IBAction func itemsBtnAction(_ sender: Any) {
//        let titleColor = UIColor(red: 245/255, green: 128/255, blue: 0/255, alpha: 1)
//             itemsBtn.setTitleColor(titleColor, for: .normal)
//             ordersBtn.setTitleColor(.black, for: .normal)
//             accountBtn.setTitleColor(.black, for: .normal)
//        let vc = ItemsViewController() //change this to your class name
//            AppDelegate.currentViewContoller.present(vc, animated: true, completion: nil)
//    }
//    @IBAction func accountBtnAction(_ sender: Any) {
//        let titleColor = UIColor(red: 245/255, green: 128/255, blue: 0/255, alpha: 1)
//             accountBtn.setTitleColor(titleColor, for: .normal)
//             itemsBtn.setTitleColor(.black, for: .normal)
//             ordersBtn.setTitleColor(.black, for: .normal)
//    }
//}
}
