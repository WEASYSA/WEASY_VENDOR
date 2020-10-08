//
//  ConfirmCompleteViewController.swift
//  WeasyVendor
//
//  Created by Amal Elgalant on 2/17/20.
//  Copyright © 2020 Amal Elgalant. All rights reserved.
//

import UIKit

public protocol ConfirmCompleteDelegate: class {
    func confirmComplete()
}

class ConfirmCompleteViewController: UIViewController {
    open weak var Delegate: ConfirmCompleteDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmBtn(_ sender: Any) {
        Delegate?.confirmComplete()
        self.dismiss(animated: false, completion: nil)

    }
    
    @IBAction func cancel(_ sender: Any) {
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
