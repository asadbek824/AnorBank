//
//  MyCardsCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 22/01/24.
//

import UIKit

final class MyCardsCell: UICollectionViewCell {
    
    let addButton = UIButton(type: .system)
    let addButtonText = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.layer.cornerRadius = 10
        
        setUpAddButton()
        setUpAddButtonText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyCardsCell {
    
    private func setUpAddButton() {
        
        addSubview(addButton)
        
        addButton.setConstraint(.yCenter, from: self, 0)
        addButton.setConstraint(.xCenter, from: self, -50)
        addButton.tintColor = .appColor.primary
    }
    
    private func setUpAddButtonText() {
        
        addSubview(addButtonText)
        
        addButtonText.setConstraint(.yCenter, from: self, 0)
        addButtonText.setConstraint(.xCenter, from: self, 20)
        addButtonText.titleLabel?.font = .boldSystemFont(ofSize: 14)
        addButtonText.tintColor = .black
    }
}
