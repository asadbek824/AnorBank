//
//  UIViewController+.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 31/01/24.
//

import UIKit

protocol presenterVCProtocol {
    
    func present(with vc: UIViewController)
    func pushVC(with vc: UIViewController)
    func popVC()
}

extension UIViewController: presenterVCProtocol {
    
    func setUpBackButton() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .done,
            target: self,
            action: #selector(backButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .appColor.primary

    }
    
    @objc private func backButtonTapped() {
        popVC()
    }
    
    func present(with vc: UIViewController) {
        present(vc, animated: true)
    }
    
    func pushVC(with vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func popVC() {
        navigationController?.popViewController(animated: true)
    }
}
