//
//  ViewController.swift
//  StringAttributedDemo
//
//  Created by Yudai.Hirose on 2017/07/17.
//  Copyright © 2017年 廣瀬雄大. All rights reserved.
//

import UIKit
import StringAttribute

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
    }
    
    
    private func setupLabel() {
        let attributeText = NSMutableAttributedString(string: "19,800円")
        let textSize = attributeText.string.characters.count
        
        attributeText.addAttributes(baseAttributes, range: NSRange(location: 0, length: textSize))
        attributeText.addAttributes(priceLargeAttributes, range: NSRange(location: 0, length: 3))
        attributeText.addAttributes(priceSpaceAttributes, range: NSRange(location: 5, length: 2))
        attributeText.addAttributes(yenAttributes, range: NSRange(location: 6, length: 1))
        
        label.attributedText = attributeText
    
    }
    
    
    private var baseAttributes: [String: Any] {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 5.0, height: 5.0)
        shadow.shadowBlurRadius = 5.0
        
        let attributes: [String: Any] = [
            NSForegroundColorAttributeName: #colorLiteral(red: 0.7803921569, green: 0.01960784314, blue: 0.02352941176, alpha: 1),
            NSStrokeColorAttributeName: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
            NSStrokeWidthAttributeName: -3.0,
            NSShadowAttributeName: shadow,
            NSFontAttributeName: UIFont(name: "AmericanTypewriter-CondensedBold", size: 40.0)!,
            NSKernAttributeName: "hoge",
            NSObliquenessAttributeName: 0.4, // 文字を斜めにする
        ]
        
        return attributes
    }
    
    private var priceLargeAttributes: [String: Any] {
        let attributes: [String: Any] = [
            NSFontAttributeName: UIFont(name: "AmericanTypewriter-CondensedBold", size: 50.0)!,
            ]
        
        return attributes
    }
    
    private var priceSpaceAttributes: [String: Any] {
        let attributes: [String: Any] = [
            NSKernAttributeName: 7.0,
            ]
        
        return attributes
    }
    
    private var yenAttributes: [String: Any] {
        let attributes: [String: Any] = [
            NSFontAttributeName: UIFont(name: "HiraginoSans-W6", size: 25.0)!,
            NSObliquenessAttributeName: 0.0,
            ]
        
        return attributes
    }
}
