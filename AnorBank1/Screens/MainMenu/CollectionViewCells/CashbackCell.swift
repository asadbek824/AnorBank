//
//  CashbackCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 22/01/24.
//

import UIKit

final class CashbackCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    let earnedLabel = UILabel()
    let moneyLabel = UILabel()
    let upToLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.layer.cornerRadius = 10
        
        setUpTitleLabel()
        setUpEarnedLabel()
        setUpMoneyLabel()
        setUpUpToLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CashbackCell {
    
    private func setUpTitleLabel() {
        
        contentView.addSubview(titleLabel)
        
        titleLabel.setConstraint(.top, from: contentView, 20)
        titleLabel.setConstraint(.left, from: contentView, 15)
        titleLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    private func setUpEarnedLabel() {
        
        contentView.addSubview(earnedLabel)
        
        earnedLabel.setConstraint(.top, from: contentView, 50)
        earnedLabel.setConstraint(.left, from: contentView, 15)
        earnedLabel.font = .systemFont(ofSize: 14)
        earnedLabel.textColor = .rgbAll(116)
    }
    
    private func setUpMoneyLabel(){
        
        contentView.addSubview(moneyLabel)
        
        moneyLabel.setConstraint(.top, from: contentView, 70)
        moneyLabel.setConstraint(.left, from: contentView, 15)
        moneyLabel.font = .systemFont(ofSize: 18)
        moneyLabel.textColor = .systemGreen
    }
    
    private func setUpUpToLabel() {
        
        contentView.addSubview(upToLabel)
        
        upToLabel.setConstraint(.top, from: contentView, 20)
        upToLabel.setConstraint(.right, from: contentView, 15)
        upToLabel.setConstraint(.width, from: contentView, 80)
        upToLabel.backgroundColor = .systemGreen
        upToLabel.layer.cornerRadius = 8
        upToLabel.clipsToBounds = true
        upToLabel.textColor = .white
        upToLabel.textAlignment = .center
        upToLabel.font = .systemFont(ofSize: 14)
    }
}

