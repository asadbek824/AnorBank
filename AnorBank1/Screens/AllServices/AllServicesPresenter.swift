//
//  AllServicesPresenter.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 08/02/24.
//

import UIKit

protocol AllServicesPresenterable {
    func numberOfSections(in tableView: UITableView) -> Int
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
}

final class AllServicesPresenter: AllServicesPresenterable {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 9
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ViewCell else { return UITableViewCell() }
            
            if indexPath.row == 0 {
                cell.titleLabel.text = "Online government services"
                cell.classificationLabel.text = "Here you can get certificates or services of the \nUnifield Portal of Public Services"
            } else {
                cell.newsImageView.isHidden = true
                
                cell.titleLabel.setConstraint(.top, from: cell, 25)
                cell.titleLabel.setConstraint(.left, from: cell, 30)
                
                cell.titleLabel.text = "Insurance companies"
                
                cell.classificationLabel.setConstraint(.bottom, from: cell, 0)
                cell.classificationLabel.setConstraint(.left, from: cell, 30)
                
                cell.classificationLabel.text = "Order and pay for an insurance policy"
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "servicesCell", for: indexPath) as? ServicesCell else { return UITableViewCell() }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120
        } else {
            return 80
        }
    }
}
