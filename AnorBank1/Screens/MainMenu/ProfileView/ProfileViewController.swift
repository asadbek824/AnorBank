//
//  ProfileViewController.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 23/01/24.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    //MARK: - UIElements
    private let profileView = ProfileView()
    private let profilePresenter: ProfilePresenterable
    
    init(profilePresenter: ProfilePresenterable) {
        self.profilePresenter = profilePresenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        
        view = profileView
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Показать tabBar при исчезновении ProfileViewController
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appColor.primary
        
        self.tabBarController?.tabBar.isHidden = true
        
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
        
        setUpNavigation()
    }
    
    @objc private func leftBarButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func rightBarButtonTapped() {
        present(profileView.alert, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileViewController {
    
    private func setUpNavigation() {
        
        navigationItem.title = "Profile"
        
        let leftBarButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(leftBarButtonTapped)
        )
        let rightBarButton = UIBarButtonItem(
            image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"),
            style: .plain,
            target: self,
            action: #selector(rightBarButtonTapped)
        )
        
        leftBarButton.tintColor = .white
        rightBarButton.tintColor = .white
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

//MARK: - extension to TableView Delegate and DataSourse
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profilePresenter.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        profilePresenter.heightForRowAt(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        profilePresenter.cellForRowAt(tableView, for: indexPath)
    }
}
