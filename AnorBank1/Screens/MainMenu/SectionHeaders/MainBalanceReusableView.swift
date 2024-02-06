//
//  MainBalanceReusableView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 22/01/24.
//

import UIKit

protocol MainBalanceReusableViewDelegate: AnyObject {
    func settingsButtonTapped()
}

final class MainBalanceReusableView: UICollectionReusableView {
    
    let titleLabel = UILabel()
    let totalBalanceButton = UIButton(type: .system)
    let balanceButton = UIButton(type: .system)
    let settingsButton = UIButton(type: .system)
    let seeButton = UIButton(type: .system)
    
    private var isSecureTextEntry = false
    
    weak var delegate: MainBalanceReusableViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpTitleLabel()
        setUpTotalBalanceButton()
        setUpBalanceButton()
        setUpSettingsButton()
        setUpSeeButton()
    }
    
    @objc private func settingsButtonTapped(_ sender: UIButton) {
        delegate?.settingsButtonTapped()
    }
    
    @objc private func seeButtonTapped(_ sender: UIButton){
        isSecureTextEntry.toggle() // Toggle the visibility of the balanceButton
        if isSecureTextEntry {
            balanceButton.setTitle("******", for: .normal) // Set the title to "******" if the balanceButton is hidden
        } else {
            balanceButton.setTitle("0.00 UZS", for: .normal) // Set the actual balance text if the balanceButton is visible
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainBalanceReusableView {
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.top, from: self, 40)
        titleLabel.setConstraint(.left, from: self, 16)
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 14)
    }
    
    private func setUpTotalBalanceButton() {
        
        addSubview(totalBalanceButton)
        
        totalBalanceButton.setConstraint(.left, from: self, 16)
        totalBalanceButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        totalBalanceButton.setConstraint(.haight, from: self, 30)
        totalBalanceButton.setConstraint(.width, from: self, 30)
        totalBalanceButton.tintColor = .white
        settingsButton.isUserInteractionEnabled = true
    }
    
    private func setUpBalanceButton() {
        
        addSubview(balanceButton)
        
        balanceButton.setConstraint(.haight, from: self, 20)
        balanceButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14).isActive = true
        balanceButton.leadingAnchor.constraint(equalTo: totalBalanceButton.trailingAnchor, constant: 0).isActive = true
        balanceButton.titleLabel?.font = .boldSystemFont(ofSize: 25)
        balanceButton.tintColor = .white
    }
    
    private func setUpSettingsButton() {
        addSubview(settingsButton)
        
        settingsButton.setConstraint(.top, from: self, 65)
        settingsButton.setConstraint(.right, from: self, 16)
        settingsButton.setConstraint(.haight, from: self, 30)
        settingsButton.setConstraint(.width, from: self, 30)
        settingsButton.tintColor = .white
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
    }
    
    private func setUpSeeButton() {
        
        addSubview(seeButton)
        
        seeButton.setConstraint(.top, from: self, 65)
        seeButton.setConstraint(.haight, from: self, 30)
        seeButton.setConstraint(.width, from: self, 30)
        seeButton.trailingAnchor.constraint(equalTo: settingsButton.leadingAnchor, constant: -10).isActive = true
        seeButton.tintColor = .white
        seeButton.addTarget(self, action: #selector(seeButtonTapped), for: .touchUpInside)
    }
}
