//
//  SectionHeaders.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 22/01/24.
//

import UIKit

final class SectionHeaders: UICollectionReusableView {
    
    //MARK: - UIElements
    let titleLabel = UILabel()
    let chevronButton = UIButton(type: .system)
    let allButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        setUpTitleLabel()
        setUpChevronButton()
        setUpAllButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extention to SectionHeaders
extension SectionHeaders {
    
    private func setUpTitleLabel() {
        
        addSubview(titleLabel)
        
        titleLabel.setConstraint(.yCenter, from: self, 0)
        titleLabel.setConstraint(.bottom, from: self, 10)
        titleLabel.setConstraint(.left, from: self, 16)
        titleLabel.font = .boldSystemFont(ofSize: 18)
    }
    
    private func setUpChevronButton() {
        
        addSubview(chevronButton)
        
        chevronButton.setConstraint(.yCenter, from: self, 0)
        chevronButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
        chevronButton.titleLabel?.font = .systemFont(ofSize: 14)
        chevronButton.tintColor = .black
    }
    
    private func setUpAllButton() {
        
        addSubview(allButton)
        
        allButton.setConstraint(.yCenter, from: self, 0)
        allButton.setConstraint(.right, from: self, 16)
        allButton.tintColor = .black
    }
}

//MARK: - setUp Shadow in HeaderSection
extension SectionHeaders {
    
    func applyShadow(withHeight height: CGFloat) {
        let shadowPath = UIBezierPath(
            roundedRect: CGRect(x: 0, y: 0, width: bounds.width, height: height),
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 10, height: 10)
        ).cgPath
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7.0
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        layer.shadowPath = shadowPath
    }
}
