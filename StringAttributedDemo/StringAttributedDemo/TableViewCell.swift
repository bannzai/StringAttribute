//
//  TableViewCell.swift
//  StringAttributedDemo
//
//  Created by Yudai.Hirose on 2017/07/18.
//  Copyright © 2017年 廣瀬雄大. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = ""
    }
}
