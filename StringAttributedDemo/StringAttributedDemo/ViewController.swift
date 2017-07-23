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
    
    fileprivate let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
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
        
        tableView.backgroundColor = .white
        
        setupAttributedStrings()
        
        tableView.reloadData()
    }
    
    func setupAttributedStrings() {
        attributedStrings = [
            
            "StringAttribute\nis simple to write about NSAttributedString\nby bannzai\n"
                .attributed()
                .apply(with: .font(UIFont.boldSystemFont(ofSize: 30)))
                .apply(with: .font(UIFont(name: "Zapfino", size: 30)!), in: 0..<6)
                .apply(with: .font(UIFont.systemFont(ofSize: 30)), for: "Attribute", to: .first)
                .apply(with: .foregroundColor(.white))
                .apply(with: .foregroundColor(.cyan), for: "String", to: .all)
                .apply(with: .foregroundColor(.yellow), for: "t", to: .first)
                .apply(with: .foregroundColor(.red), for: "i", to: .first)
                .apply(with: .foregroundColor(.green), for: "b", to: .just(3))
                .apply(with: [.underline(.styleSingle), .foregroundColor(.magenta)], for: "bannzai")
                .apply(with: [.foregroundColor(.orange), .font(UIFont.boldSystemFont(ofSize: 40))], for: "write")
                .apply(
                    with: [
                        .paragraph(.firstLineHeadIndent(UIScreen.main.bounds.width - 200)),
                        .font(UIFont(name: "Zapfino", size: 20)!)
                    ],
                    for: "by bannzai"
            ),

            "red text".attributed().apply(with: .foregroundColor(.red)),
            
            "Red is red, blue is blue"
                .attributed()
                .apply(with: .foregroundColor(.red), for: "red", to: .first)
                .apply(with: .foregroundColor(.blue), for: "blue", to: .first),
            
            "Line space is 80px \nand this line head indent is 40px"
                .attributed()
                .apply(with: .paragraph(.lineSpacing(80)))
                .apply(with: .paragraph(.firstLineHeadIndent(40)), for: "and"),
            
            "this is green, this is blue, this is orange, this is gray."
                .attributed()
                .apply(with: .foregroundColor(.blue), for: "this")
                .apply(with: .foregroundColor(.green), for: "this", to: .first)
                .apply(with: .foregroundColor(.orange), for: "this", to: .just(2))
                .apply(with: .foregroundColor(.gray), for: "this", to: .last),
            
            "This is my face\n"
                .attributed()
                .append(with: #imageLiteral(resourceName: "face"), bounds: CGRect(origin: .zero, size: CGSize(width: 80, height: 80)))
                .apply(with: .paragraph(.lineSpacing(30))),
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
