//
//  SectionType.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 22/01/24.
//

import Foundation

//MARK: - enum SectionType
enum MainViewSectionTypes: Int, CaseIterable {
    case transferView = 0
    case becomecCliennt = 1
    case promtView = 2
    case cashback = 3
    case cards = 4
    case saved = 5
    case credits = 6
    case deposits = 7
    case home
    case exchange
}

extension MainViewSectionTypes {
    func getNumberOfItems() -> Int {
        switch self {
        case .transferView:
            return 4
        case .becomecCliennt:
            return 1
        case .promtView:
            return 14
        case .cashback:
            return 1
        case .cards:
            return 1
        case .saved:
            return 1
        case .credits:
            return 2
        case .deposits:
            return 6
        case .home:
            return 1
        case .exchange:
            return 1
        }
    }
}
