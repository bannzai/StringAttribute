//
//  UISegmentedControl+StringAttribute.swift
//  StringAttribute
//
//  Created by Hirose.Yudai on 2017/08/07.
//  Copyright © 2017年 Yudai.Hirose. All rights reserved.
//

import UIKit

extension UISegmentedControl {
    open func setTitleText(attributes: [StringAttribute], for state: UIControlState) {
        
        let titleTextAttributes = attributes
            .flatMap { $0.attributes }
            .reduce([AnyHashable: Any]()) { (result, pair) in
                var mutableDictionary = result
                mutableDictionary[pair.key] = pair.value
                return mutableDictionary
        }
        
        setTitleTextAttributes(titleTextAttributes, for: state)
    }
}
