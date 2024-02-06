//
//  CardsReusableView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 04/02/24.
//

import UIKit

final class CardsReusableView: UICollectionReusableView {
    
    let titleLabel = UILabel()
    let squareFourButton = UIButton(type: .system)
    let squareTwoButton = UIButton(type: .system)
    let arrowButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setUpTitleLabel()
        setUpSquareFourButton()
        setUpSquareTwoButton()
        setUpArrowButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardsReusableView {
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.yCenter, from: self, 0)
        titleLabel.setConstraint(.left, from: self, 16)
        
        titleLabel.font = .systemFont(ofSize: 25)
    }
    
    private func setUpSquareFourButton() {
        
        addSubview(squareFourButton)
        
        squareFourButton.setConstraint(.yCenter, from: self, 0)
        squareFourButton.setConstraint(.right, from: self, 16)
        squareFourButton.setConstraint(.width, from: self, 25)
        squareFourButton.setConstraint(.haight, from: self, 25)
        
        squareFourButton.tintColor = .appColor.primary
    }
    
    private func setUpSquareTwoButton() {
        
        addSubview(squareTwoButton)
        
        squareTwoButton.setConstraint(.yCenter, from: self, 0)
        squareTwoButton.setConstraint(.width, from: self, 25)
        squareTwoButton.setConstraint(.haight, from: self, 25)
        squareTwoButton.trailingAnchor.constraint(equalTo: squareFourButton.leadingAnchor, constant: -10).isActive = true
        
        squareTwoButton.tintColor = .appColor.primary
    }
    
    private func setUpArrowButton(){
        
        addSubview(arrowButton)
        
        arrowButton.setConstraint(.yCenter, from: self, 0)
        arrowButton.setConstraint(.width, from: self, 25)
        arrowButton.setConstraint(.haight, from: self, 25)
        arrowButton.trailingAnchor.constraint(equalTo: squareTwoButton.leadingAnchor, constant: -10).isActive = true
        
        arrowButton.tintColor = .appColor.primary
    }
}
