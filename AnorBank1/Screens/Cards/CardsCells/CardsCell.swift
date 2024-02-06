//
//  CardsCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 04/02/24.
//

import UIKit

final class CardsCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    let balanceLabel = UILabel()
    let cardNumber = UILabel()
    let cardTermLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray6
        layer.cornerRadius = 20
        
        setUpTitleLabel()
        setUpBalanceLabel()
        setUpCardLabel()
        setUpCardTermLabel()
        setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardsCell {
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.yCenter, from: self, -20)
        titleLabel.setConstraint(.left, from: self, 10)
        
        titleLabel.font = .systemFont(ofSize: 12)
    }
    
    private func setUpBalanceLabel() {
        
        addSubview(balanceLabel)
        
        balanceLabel.setConstraint(.yCenter, from: self, 10)
        balanceLabel.setConstraint(.left, from: self, 10)
    }
    
    private func setUpCardLabel() {
        
        addSubview(cardNumber)
        
        cardNumber.setConstraint(.bottom, from: self, 10)
        cardNumber.setConstraint(.left, from: self, 20)
        
        cardNumber.font = .systemFont(ofSize: 12)
    }
    
    private func setUpCardTermLabel() {
        
        addSubview(cardTermLabel)
        
        cardTermLabel.setConstraint(.bottom, from: self, 10)
        cardTermLabel.setConstraint(.xCenter, from: self, 0)
        
        cardTermLabel.font = .systemFont(ofSize: 12)
    }
    
    private func setUpImageView() {
        
        addSubview(imageView)
        
        imageView.setConstraint(.bottom, from: self, 10)
        imageView.setConstraint(.right, from: self, 10)
        imageView.setConstraint(.width, from: self, 25)
        imageView.setConstraint(.haight, from: self, 25)
        
        imageView.backgroundColor = .appColor.primary
    }
}
