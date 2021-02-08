//
//  String + Extension.swift
//  WeasyVendor
//
//  Created by Sherif on 08/02/2021.
//  Copyright © 2021 Amal Elgalant. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
