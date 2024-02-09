//
//  MonitoringViewController.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 21/01/24.
//

import UIKit

final class MonitoringViewController: UIViewController {
    
    private let monitoringView = MonitoringView()
    private let presenter: MonitoringPresenterable
    
    init(presenter: MonitoringPresenterable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        view = monitoringView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .rgbAll(246)
        
        monitoringView.tableView.dataSource = self
        monitoringView.tableView.delegate = self
        
        setUpNavController()
    }
    
    @objc private func rightBellBarButtonTapped() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MonitoringViewController {
    
    private func setUpNavController() {
        
        title = "Monitoring"
        
        let rightBellBarButton = UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: self,
            action: #selector(rightBellBarButtonTapped)
        )
        
        rightBellBarButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = rightBellBarButton
    }
}

extension MonitoringViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        presenter.tableView(tableView, heightForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        presenter.tableView(tableView, viewForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        presenter.tableView(tableView, heightForHeaderInSection: section)
    }
}
