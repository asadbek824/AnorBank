//
//  TableViewCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 23/01/24.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    let cellImageView = UIImageView()
    let titleLabel = UILabel()
    let rightButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .rgb(246, 247, 246)
        
        setUpImageView()
        setUpTitleLabel()
        setUpRightLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableViewCell {
    
    private func setUpImageView() {
        
        addSubview(cellImageView)
        
        cellImageView.setConstraint(.left, from: self, 20)
        cellImageView.setConstraint(.top, from: self, 10)
        cellImageView.setConstraint(.bottom, from: self, 10)
        cellImageView.setConstraint(.width, from: self, 40)
        cellImageView.tintColor = .appColor.primary
    }
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.top, from: self, 10)
        titleLabel.setConstraint(.bottom, from: self, 10)
        titleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 15).isActive = true
    }
    
    private func setUpRightLabel() {
        
        addSubview(rightButton)
        
        rightButton.setConstraint(.top, from: self, 10)
        rightButton.setConstraint(.bottom, from: self, 10)
        rightButton.setConstraint(.right, from: self, 20)
        rightButton.setConstraint(.width, from: self, 75)
        rightButton.titleLabel?.font = .systemFont(ofSize: 14)
        rightButton.tintColor = .systemGray
    }
}
