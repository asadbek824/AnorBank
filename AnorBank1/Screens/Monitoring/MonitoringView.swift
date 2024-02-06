//
//  MonitoringView.swift
//  AnorBank1
//
//  Created by Asadbek Yoldoshev on 05/02/24.
//

import UIKit

final class MonitoringView: UIView {
    
    private let incomeView = UIView()
    private let expensesView = UIView()
    private let balanceIncomeLabel = UILabel()
    private let balanceExpemsesLabel = UILabel()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpIncomeView()
        setUpExpensesView()
        setUpBalanceIncomeLabel()
        setUpBalanceExpemsesLabel()
        setUpTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MonitoringView {
    
    private func setUpIncomeView() {
        
        addSubview(incomeView)
        
        incomeView.setConstraint(.top, from: self, 130)
        incomeView.setConstraint(.left, from: self, 16)
        incomeView.setConstraint(.width, from: self, (UIScreen.main.bounds.width / 2 - 20))
        incomeView.setConstraint(.haight, from: self, 80)
        
        incomeView.backgroundColor = .white
        incomeView.layer.cornerRadius = 15
        
        let incomeLabel = UILabel()
        
        incomeView.addSubview(incomeLabel)
        
        incomeLabel.setConstraint(.xCenter, from: incomeView, 0)
        incomeLabel.setConstraint(.yCenter, from: incomeView, -20)
        incomeLabel.text = "Income"
        incomeLabel.font = .systemFont(ofSize: 14)
    }
    
    private func setUpExpensesView() {
        
        addSubview(expensesView)
        
        expensesView.setConstraint(.top, from: self, 130)
        expensesView.setConstraint(.right, from: self, 16)
        expensesView.setConstraint(.haight, from: self, 80)
        expensesView.leadingAnchor.constraint(equalTo: incomeView.trailingAnchor, constant: 10).isActive = true
        
        expensesView.backgroundColor = .white
        expensesView.layer.cornerRadius = 15
        
        let expensesLabel = UILabel()
        
        expensesView.addSubview(expensesLabel)
        
        expensesLabel.setConstraint(.xCenter, from: expensesView, 0)
        expensesLabel.setConstraint(.yCenter, from: expensesView, -20)
        expensesLabel.text = "Expenses"
        expensesLabel.font = .systemFont(ofSize: 14)
    }
    
    private func setUpBalanceIncomeLabel() {
        
        incomeView.addSubview(balanceIncomeLabel)
        
        balanceIncomeLabel.setConstraint(.xCenter, from: incomeView, 0)
        balanceIncomeLabel.setConstraint(.yCenter, from: incomeView, 10)
        
        let attributedString = NSMutableAttributedString(string: "+0.00 UZS")
        
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.systemGreen,
            range: NSRange(location: 0, length: 2)
        )
        attributedString.addAttribute(
            .foregroundColor,
            value: UIColor.gray,
            range: NSRange(location: 3, length: 6)
        )
        attributedString.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 20),
            range: NSRange(location: 0, length: 3)
        )
        attributedString.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 16),
            range: NSRange(location: 3, length: 6)
        )
        
        balanceIncomeLabel.attributedText = attributedString
    }
    
    private func setUpBalanceExpemsesLabel() {
        
        expensesView.addSubview(balanceExpemsesLabel)
        
        balanceExpemsesLabel.setConstraint(.xCenter, from: expensesView, 0)
        balanceExpemsesLabel.setConstraint(.yCenter, from: expensesView, 10)
        
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
            value: UIFont.systemFont(ofSize: 20),
            range: NSRange(location: 0, length: 7)
        )
        attributedString.addAttribute(
            .font,
            value: UIFont.systemFont(ofSize: 16),
            range: NSRange(location: 8, length: 6)
        )
        
        balanceExpemsesLabel.attributedText = attributedString
    }
    
    private func setUpTableView() {
        
        addSubview(tableView)
        
        tableView.setConstraint(.left, from: self, 0)
        tableView.setConstraint(.right, from: self, 0)
        tableView.setConstraint(.bottom, from: self, 0)
        tableView.topAnchor.constraint(equalTo: incomeView.bottomAnchor, constant: 10).isActive = true
        tableView.register(MonitoringCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
    }
}
