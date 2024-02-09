//
//  MonitoringCell.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 05/02/24.
//

import UIKit

final class MonitoringCell: UITableViewCell {
    
    private let view = UIView()
    let cellImageView = UIImageView()
    let nameLabel = UILabel()
    let valueLabel = UILabel()
    let timeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        setUpView()
        setUpImageView()
        setUpNameLabel()
        setUpValueLabel()
        setUpTimeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MonitoringCell {
    
    private func setUpView() {
        
        addSubview(view)
        
        view.setConstraint(.top, from: self, 2)
        view.setConstraint(.left, from: self, 15)
        view.setConstraint(.right, from: self, 15)
        view.setConstraint(.bottom, from: self, 2)
        
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
    }
    
    private func setUpImageView() {
        
        view.addSubview(cellImageView)
        
        cellImageView.setConstraint(.top, from: view, 10)
        cellImageView.setConstraint(.bottom, from: view, 10)
        cellImageView.setConstraint(.left, from: view, 10)
        cellImageView.setConstraint(.width, from: view, 60)
        
        cellImageView.backgroundColor = .blue
        cellImageView.layer.cornerRadius = 10
    }
    
    private func setUpNameLabel() {
        
        view.addSubview(nameLabel)
        
        nameLabel.setConstraint(.yCenter, from: view, 0)
        nameLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10).isActive = true
        
        nameLabel.font = .boldSystemFont(ofSize: 15)
    }
    
    private func setUpValueLabel() {
        
        view.addSubview(valueLabel)
        
        valueLabel.setConstraint(.yCenter, from: view, -20)
        valueLabel.setConstraint(.right, from: view, 15)
    }
    
    private func setUpTimeLabel() {
        
        view.addSubview(timeLabel)
        
        timeLabel.setConstraint(.yCenter, from: view, 10)
        timeLabel.setConstraint(.right, from: view, 15)
        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 14)
    }
}
