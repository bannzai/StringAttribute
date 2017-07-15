//
//  String+NSRange.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/15.
//  Copyright © 2017年 廣瀬雄大. All rights reserved.
//

import Foundation

extension String {
    func range(of string: String) -> NSRange {
        return (self as NSString).range(of: string)
    }
    
    func ranges(of string: String) -> [NSRange] {
        var ranges: [NSRange] = []
        var range: NSRange
        
        repeat {
            range = (self as NSString).range(of: string)
            ranges.append(range)
        } while range.location == NSNotFound
        
        return ranges
    }
}
