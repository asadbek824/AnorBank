//
//  MonitoringPresenter.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 05/02/24.
//

import UIKit

protocol MonitoringPresenterable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    func numberOfSections(in tableView: UITableView) -> Int
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
}

final class MonitoringPresenter: MonitoringPresenterable {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 2
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MonitoringCell else { return UITableViewCell() }
        
        cell.nameLabel.text = "860006******9696"
        cell.timeLabel.text = "14:14"
        
        let attributedString = NSMutableAttributedString(string: "-12 060.00 UZS")
        
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.black,
            range: NSRange(location: 0, length: 7)
        )
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.gray,
            range: NSRange(location: 8, length: 6)
        )
        attributedString.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 16),
            range: NSRange(location: 0, length: 7)
        )
        attributedString.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 12),
            range: NSRange(location: 8, length: 6)
        )
        
        cell.valueLabel.attributedText = attributedString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        let dataLabel = UILabel()
        
        headerView.backgroundColor = .rgbAll(246)
        
        headerView.addSubview(dataLabel)
        dataLabel.setConstraint(.yCenter, from: headerView, 0)
        dataLabel.setConstraint(.left, from: headerView, 15)
        
        if section == 0 {
            dataLabel.text = "02.02.2024"
        } else if section == 1 {
            dataLabel.text = "20.01.2024"
        } else {
            dataLabel.text = "02.01.2023"
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}
