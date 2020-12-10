//
//  String+Attributed.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/14.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation

extension String {
    public func attributed() -> NSAttributedString {
        return NSAttributedString(string: self)
    }
}
