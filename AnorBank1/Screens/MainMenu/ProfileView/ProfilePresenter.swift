//
//  ProfilePresenter.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 23/01/24.
//

import UIKit

protocol ProfilePresenterable: AnyObject {
    func numberOfRowsInSection(in section: Int) -> Int
    func heightForRowAt(for indexPath: IndexPath) -> CGFloat
    func cellForRowAt(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}

final class ProfilePresenter: ProfilePresenterable {
    
    func numberOfRowsInSection(in section: Int) -> Int { 4 }
    
    func heightForRowAt(for indexPath: IndexPath) -> CGFloat { 60 }
    
    func cellForRowAt(_ tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        switch indexPath.row {
        case 0 :
            cell.cellImageView.image = UIImage(systemName: "person")
            cell.titleLabel.text = "Personal data"
            cell.rightButton.setImage(UIImage(systemName: "exclamationmark.circle"), for: .normal)
            cell.cellImageView.tintColor = .red
            cell.rightButton.tintColor = .red
            cell.titleLabel.textColor = .red
        case 1 :
            cell.cellImageView.image = UIImage(systemName: "lock")
            cell.titleLabel.text = "Security"
            cell.rightButton.isHidden = true
        case 2 :
            cell.cellImageView.image = UIImage(systemName: "gearshape")
            cell.titleLabel.text = "App Theme"
            cell.rightButton.isHidden = true
        case 3 :
            cell.cellImageView.image = UIImage(systemName: "globe")
            cell.titleLabel.text = "Language"
            cell.rightButton.setTitle("English", for: .normal)
            
            let image = UIImageView()
            
            cell.rightButton.addSubview(image)
            
            image.image = UIImage(systemName: "chevron.right")
            
            image.translatesAutoresizingMaskIntoConstraints = false
            image.trailingAnchor.constraint(equalTo: cell.rightButton.trailingAnchor).isActive = true
            image.setConstraint(.yCenter, from: cell.rightButton, 0)
        default :
            cell.cellImageView.isHidden = true
            cell.titleLabel.isHidden = true
            cell.rightButton.isHidden = true
        }
        
        return cell
    }
}
