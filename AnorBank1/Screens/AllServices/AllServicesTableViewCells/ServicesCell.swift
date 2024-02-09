//
//  ServicesCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 08/02/24.
//

import UIKit

final class ServicesCell: UITableViewCell {
    
    let servicesImageView = UIImageView()
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        setUpServicesImageView()
        setUpTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ServicesCell {
    
    private func setUpServicesImageView() {
        
        addSubview(servicesImageView)
        
        servicesImageView.setConstraint(.top, from: self, 10)
        servicesImageView.setConstraint(.bottom, from: self, 10)
        servicesImageView.setConstraint(.left, from: self, 10)
        servicesImageView.setConstraint(.width, from: self, 60)
        
        servicesImageView.backgroundColor = .cyan
        servicesImageView.layer.cornerRadius = 15
    }
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.yCenter, from: self, 0)
        titleLabel.leadingAnchor.constraint(equalTo: servicesImageView.trailingAnchor, constant: 10).isActive = true
        
        titleLabel.text = "Order a card"
        titleLabel.font = .boldSystemFont(ofSize: 18)
    }
}
