//
//  String+NSRange.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/15.
//  Copyright © 2017年 廣瀬雄大. All rights reserved.
//

import Foundation

extension String {
    private func toNSRange(for range: Range<String.Index>) -> NSRange {
        let lower = String.UTF16View.Index(range.lowerBound, within: utf16)
        let upper = String.UTF16View.Index(range.upperBound, within: utf16)
        return NSRange(
            location: utf16.startIndex.distance(to: lower),
            length: utf16.distance(from: lower, to: upper)
        )
    }
    
    func ranges(of string: String) -> [NSRange] {
        var decreasingSelf = self
        var ranges: [NSRange] = []
        
        while let subStringRange = decreasingSelf.range(of: string) {
            var nsRange = toNSRange(for: subStringRange)
            nsRange.location += utf16.count - decreasingSelf.utf16.count
            ranges.append(nsRange)
            
            decreasingSelf.removeSubrange(subStringRange)
        }
        
        return ranges
    }
}
