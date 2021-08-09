//
//  ConfirmReadyToPickupViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/17/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

public protocol ConfirmReadyToPickupDelegate: class {
    func confirmReady()
}

class ConfirmReadyToPickupViewController: UIViewController {
    open weak var Delegate: ConfirmReadyToPickupDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmBtn(_ sender: Any) {
        Delegate?.confirmReady()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)

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
