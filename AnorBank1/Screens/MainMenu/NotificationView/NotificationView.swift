//
//  NotificationView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 31/01/24.
//

import UIKit

final class NotificationView: UIView {
    
    //MARK: - UIElements
    private let notificationView = UIView()
    private let segmentedController = UISegmentedControl()
    private let notificationsButton = UIButton(type: .system)
    private let notificationsView  = UIView()
    private let segmentNotificationView = SegmentNotificationView()
    private let segmentBankView = SegmentBankView()
    private let segmentApplicationView = SegmentApplicationView()
    private let segmentInvoicesView = SegmentInvoicesView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpNotificationView()
        setUpSegmentedController()
        setUpNotificationButton()
        setUpNotificationsView()
        setUpSegmentBankView()
        setUpSegmentApplicationView()
        setUpSegmentInvoicesView()
        setUpSegmentNotificationView()
    }
    
    @objc private func segmentedControllerTapped() {
        
        
        let selectedSegmentIndex = segmentedController.selectedSegmentIndex
        
        notificationsButton.isHidden = selectedSegmentIndex != 0
        
        UIView.transition(with: notificationsView, duration: 0.5, options: [.curveEaseInOut, .transitionFlipFromLeft, .showHideTransitionViews], animations: { [self] in
            
            let viewsToHide = [segmentNotificationView, segmentBankView, segmentApplicationView, segmentInvoicesView]
            
            for view in viewsToHide {
                view.isHidden = true
            }
            
            switch selectedSegmentIndex {
            case 0:
                segmentNotificationView.isHidden = false
            case 1:
                segmentBankView.isHidden = false
            case 2:
                segmentApplicationView.isHidden = false
            case 3:
                segmentInvoicesView.isHidden = false
            default:
                break
            }
        }
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extension to NotificationView
extension NotificationView {
    
    private func setUpNotificationView(){
        
        addSubview(notificationView)
        
        notificationView.setConstraint(.bottom, from: self, 0)
        notificationView.setConstraint(.left, from: self, 0)
        notificationView.setConstraint(.right, from: self, 0)
        notificationView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        
        notificationView.backgroundColor = .white
        notificationView.layer.cornerRadius = 20
        notificationView.clipsToBounds = true
    }
    
    private func setUpSegmentedController() {
        
        notificationView.addSubview(segmentedController)
        
        segmentedController.setConstraint(.top, from: notificationView, 20)
        segmentedController.setConstraint(.left, from: notificationView, 16)
        segmentedController.setConstraint(.right, from: notificationView, 50)
        
        segmentedController.insertSegment(withTitle: "Notifications", at: 0, animated: false)
        segmentedController.insertSegment(withTitle: "Bank news", at: 1, animated: false)
        segmentedController.insertSegment(withTitle: "Applications", at: 2, animated: false)
        segmentedController.insertSegment(withTitle: "Invoices", at: 3, animated: false)
        segmentedController.selectedSegmentIndex = 0
        segmentedController.selectedSegmentTintColor = .rgb(127, 23, 56)
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.white
        ]
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor.black
        ]
        
        segmentedController.setTitleTextAttributes(selectedAttributes, for: .selected)
        segmentedController.setTitleTextAttributes(normalAttributes, for: .normal)
        
        segmentedController.addTarget(self, action: #selector(segmentedControllerTapped), for: .valueChanged)
    }
    
    private func setUpNotificationButton() {
        
        notificationView.addSubview(notificationsButton)
        
        notificationsButton.setConstraint(.haight, from: self, 30)
        notificationsButton.setConstraint(.width, from: self, 30)
        notificationsButton.centerYAnchor.constraint(equalTo: segmentedController.centerYAnchor).isActive = true
        notificationsButton.leadingAnchor.constraint(equalTo: segmentedController.trailingAnchor, constant: 10).isActive = true
        notificationsButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
        notificationsButton.tintColor = .appColor.primary
    }
    
    private func setUpNotificationsView() {
        
        notificationView.addSubview(notificationsView)
        
        notificationsView.setConstraint(.left, from: notificationView, 0)
        notificationsView.setConstraint(.right, from: notificationView, 0)
        notificationsView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor).isActive = true
        notificationsView.bottomAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: -85).isActive = true
        notificationsView.backgroundColor = .clear
    }
    
    private func setUpSegmentNotificationView() {
        
        notificationsView.addSubview(segmentNotificationView)
        
        segmentNotificationView.setConstraint(.left, from: notificationView, 0)
        segmentNotificationView.setConstraint(.right, from: notificationView, 0)
        segmentNotificationView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor).isActive = true
        segmentNotificationView.bottomAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: -85).isActive = true
    }
    
    private func setUpSegmentBankView() {
        
        notificationsView.addSubview(segmentBankView)
        
        segmentBankView.setConstraint(.left, from: notificationView, 0)
        segmentBankView.setConstraint(.right, from: notificationView, 0)
        segmentBankView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor).isActive = true
        segmentBankView.bottomAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: -85).isActive = true
    }
    
    private func setUpSegmentApplicationView() {
        
        notificationsView.addSubview(segmentApplicationView)
        
        segmentApplicationView.setConstraint(.left, from: notificationView, 0)
        segmentApplicationView.setConstraint(.right, from: notificationView, 0)
        segmentApplicationView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor).isActive = true
        segmentApplicationView.bottomAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: -85).isActive = true
    }
    
    private func setUpSegmentInvoicesView() {
        
        notificationsView.addSubview(segmentInvoicesView)
        
        segmentInvoicesView.setConstraint(.left, from: notificationView, 0)
        segmentInvoicesView.setConstraint(.right, from: notificationView, 0)
        segmentInvoicesView.topAnchor.constraint(equalTo: segmentedController.bottomAnchor).isActive = true
        segmentInvoicesView.bottomAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: -85).isActive = true
    }
}

