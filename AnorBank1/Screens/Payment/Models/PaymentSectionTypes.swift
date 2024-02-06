//
//  PaymentSectionTypes.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 04/02/24.
//

import UIKit

enum PaymentSectionTypes: Int, CaseIterable {
    case quick = 0
    case categories = 1
}

extension PaymentSectionTypes {
    func getNumberOfItems() -> Int {
        switch self {
        case .quick:
            return 7
        case .categories:
            return 33
        }
    }
}
