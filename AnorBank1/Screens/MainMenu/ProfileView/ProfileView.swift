//
//  ProfileView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 23/01/24.
//

import UIKit

final class ProfileView: UIView {
    
    //MARK: - UIElements
    private let profileView = UIView()
    private let imageView = UIImageView()
    private let numberLabel = UILabel()
    private let unidentifiedButton = UIButton(type: .system)
    let tableView = UITableView()
    let alert = UIAlertController(
        title: "Are you sure you want to exit the application?",
        message: "After signing out, all your local data will be cleard and you will need to sign in to the app again",
        preferredStyle: .alert
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpProfilView()
        setUpImageView()
        setUpNumberLabel()
        setUpUndentifiedButton()
        setUpTableView()
        setUpAlert()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extension to ProfilView
extension ProfileView {
    
    private func setUpProfilView() {
        
        self.addSubview(profileView)
        
        profileView.backgroundColor = .rgb(246, 247, 246)
        profileView.layer.cornerRadius = 20
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        profileView.setConstraint(.left, from: self, 0)
        profileView.setConstraint(.right, from: self, 0)
        profileView.setConstraint(.bottom, from: self, 0)
    }
    
    private func setUpImageView() {
        
        profileView.addSubview(imageView)
        
        imageView.setConstraint(.top, from: profileView, 50)
        imageView.setConstraint(.left, from: profileView, 20)
        imageView.setConstraint(.haight, from: self, 80)
        imageView.setConstraint(.width, from: self, 80)
        imageView.image = UIImage(systemName: "person.fill")
        imageView.tintColor = .rgbAll(189)
    }
    
    private func setUpNumberLabel() {
        
        profileView.addSubview(numberLabel)
        
        numberLabel.setConstraint(.top, from: profileView, 50)
        numberLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        numberLabel.text = "+998 94 640 50 07"
    }
    
    private func setUpUndentifiedButton() {
        
        profileView.addSubview(unidentifiedButton)

        unidentifiedButton.setConstraint(.width, from: self, 250)
        unidentifiedButton.setConstraint(.haight, from: self, 40)
        unidentifiedButton.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 15).isActive = true
        unidentifiedButton.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        unidentifiedButton.layer.cornerRadius = 10
        unidentifiedButton.backgroundColor = .rgb(175, 184, 190)
        unidentifiedButton.contentHorizontalAlignment = .left
        unidentifiedButton.setTitle("   Unidentified User", for: .normal)
        unidentifiedButton.setTitleColor(.white, for: .normal)
        
        let image = UIImageView()
        
        unidentifiedButton.addSubview(image)
        
        image.image = UIImage(systemName: "questionmark.circle")
        image.setConstraint(.top, from: unidentifiedButton, 5)
        image.setConstraint(.bottom, from: unidentifiedButton, 5)
        image.setConstraint(.right, from: unidentifiedButton, 10)
        image.setConstraint(.width, from: unidentifiedButton, 30)
        image.tintColor = .white
    }
    
    private func setUpTableView() {
        
        addSubview(tableView)
        
        tableView.setConstraint(.left, from: self, 0)
        tableView.setConstraint(.right, from: self, 0)
        tableView.setConstraint(.bottom, from: self, 0)
        tableView.topAnchor.constraint(equalTo: unidentifiedButton.bottomAnchor, constant: 10.0).isActive = true
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .rgb(246, 247, 246)
    }
    
    private func setUpAlert() {
        
        let noButton = UIAlertAction(title: "No", style: .default) { (action) in
            // Действие при нажатии на noButton
            print("Кнопка 1 нажата")
        }
        
        let yesButton = UIAlertAction(title: "Yes", style: .default) { (action) in
            // Действие при нажатии на yesButton
            print("Кнопка 2 нажата")
        }
        alert.addAction(noButton)
        alert.addAction(yesButton)
    }
}

