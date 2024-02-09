//
//  AllServicesView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 08/02/24.
//

import UIKit

final class AllServicesView: UIView {
    
    private let servicesView = UIView()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AllServicesView {
    
    private func setUpView() {
        
        addSubview(servicesView)
        
        servicesView.setConstraint(.bottom, from: self, 0)
        servicesView.setConstraint(.left, from: self, 0)
        servicesView.setConstraint(.right, from: self, 0)
        servicesView.setConstraint(.top, from: self, 100)
        
        servicesView.backgroundColor = .white
        servicesView.layer.cornerRadius = 20
    }
    
    private func setUpTableView() {
        
        servicesView.addSubview(tableView)
        
        tableView.setConstraint(.top, from: servicesView, 1)
        tableView.setConstraint(.bottom, from: servicesView, 0)
        tableView.setConstraint(.right, from: servicesView, 0)
        tableView.setConstraint(.left, from: servicesView, 0)
        
        tableView.register(ViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(ServicesCell.self, forCellReuseIdentifier: "servicesCell")
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
}
