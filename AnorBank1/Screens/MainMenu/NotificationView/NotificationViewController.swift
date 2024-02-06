//
//  NotificationViewController.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 31/01/24.
//

import UIKit

final class NotificationViewController: UIViewController {
    
    //MARK: - UIElements
    private let notificationView = NotificationView()
    
    override func loadView() {
        super.loadView()
        
        view = notificationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appColor.primary
        
        setNavigation()
    }
    
    //MARK: - @objc functions
    @objc private func leftBarButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - extension to NotificationViewController
extension NotificationViewController {
    
    private func setNavigation() {
        
        navigationItem.title = "Notification"
        setUpBackButton()
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
}
