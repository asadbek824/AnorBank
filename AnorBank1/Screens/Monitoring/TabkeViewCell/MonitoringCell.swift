//
//  MonitoringCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 05/02/24.
//

import UIKit

final class MonitoringCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .red
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
