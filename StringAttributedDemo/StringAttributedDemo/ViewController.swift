//
//  ViewController.swift
//  StringAttributedDemo
//
//  Created by Yudai.Hirose on 2017/07/17.
//  Copyright © 2017年 廣瀬雄大. All rights reserved.
//

import UIKit
import StringAttribute

class ViewController: UIViewController {
    
    fileprivate let tableView: UITableView = UITableView(frame: .zero)
    
    var attributedStrings: [NSAttributedString] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        setupAttributedStrings()
        
        tableView.reloadData()
    }
    
    func setupAttributedStrings() {
        attributedStrings = [
            "simple red text".attributed().apply(with: .foregroundColor(.red)),
            
            "red is red, blue is blue"
                .attributed()
                .apply(with: .foregroundColor(.red), for: "red", to: .first)
                .apply(with: .foregroundColor(.blue), for: "blue", to: .first),
            
            "line space is 20px \nand this line head indent is 40px"
                .attributed()
                .apply(with: .paragraph(.lineSpacing(20)))
                .apply(with: .paragraph(.headIndent(40)), for: "and")
        ]
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attributedStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.label.attributedText = attributedStrings[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}