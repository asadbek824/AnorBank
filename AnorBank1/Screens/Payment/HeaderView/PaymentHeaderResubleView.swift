//
//  PaymentHeaderResubleView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 05/02/24.
//

import UIKit

final class SectionHeader: UICollectionReusableView {
    
    let titleLabel = UILabel()
    let allButton = UIButton(type: .system)
    let installmentButton = UIButton(type: .system)
    let cashbackButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        setUpTitleLabel()
        setUpAllButton()
        setUpInstallmentButton()
        setUpCashbackButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SectionHeader {
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.top, from: self, 20)
        titleLabel.setConstraint(.left, from: self, 10)
        
        titleLabel.font = .boldSystemFont(ofSize: 18)
    }
    
    private func setUpAllButton() {
        
        addSubview(allButton)
        
        allButton.setConstraint(.bottom, from: self, 10)
        allButton.setConstraint(.left, from: self, 10)
        allButton.setConstraint(.width, from: self, 40)
        
        allButton.setTitleColor(.white, for: .normal)
        allButton.titleLabel?.font = .systemFont(ofSize: 16)
        allButton.backgroundColor = .rgb(70, 70, 73)
        allButton.layer.cornerRadius = 13
    }
    
    private func setUpInstallmentButton() {
        
        addSubview(installmentButton)
        
        installmentButton.setConstraint(.bottom, from: self, 10)
        installmentButton.setConstraint(.width, from: self, 100)
        installmentButton.leadingAnchor.constraint(equalTo: allButton.trailingAnchor, constant: 10).isActive = true
        
        installmentButton.setTitleColor(.black, for: .normal)
        installmentButton.titleLabel?.font = .systemFont(ofSize: 16)
        installmentButton.backgroundColor = .white
        installmentButton.layer.cornerRadius = 13
    }
    
    private func setUpCashbackButton() {
        
        addSubview(cashbackButton)
        
        cashbackButton.setConstraint(.bottom, from: self, 10)
        cashbackButton.setConstraint(.width, from: self, 100)
        cashbackButton.leadingAnchor.constraint(equalTo: installmentButton.trailingAnchor, constant: 10).isActive = true
        
        cashbackButton.setTitleColor(.black, for: .normal)
        cashbackButton.titleLabel?.font = .systemFont(ofSize: 16)
        cashbackButton.backgroundColor = .white
        cashbackButton.layer.cornerRadius = 13
    }
}
