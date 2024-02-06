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
}

final class MonitoringPresenter: MonitoringPresenterable {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MonitoringCell else { return UITableViewCell() }
        
        cell.separatorInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        
        return cell
    }
}
