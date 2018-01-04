//
//  String+NSRange.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/15.
//  Copyright © 2017年 廣瀬雄大. All rights reserved.
//

import Foundation

extension String {
    private func toNSRange(for range: Range<String.Index>) -> NSRange? {
        let lower = String.UTF16View.Index(range.lowerBound, within: utf16)
        let upper = String.UTF16View.Index(range.upperBound, within: utf16)
        
        guard
            let from = lower?.samePosition(in: utf16),
            let to = upper?.samePosition(in: utf16)
            else {
                assertionFailure()
                return nil
        }
        
        return NSRange(
            location: utf16.distance(from: utf16.startIndex, to: from),
            length: utf16.distance(from: from, to: to)
        )
    }
    
    func ranges(of string: String) -> [NSRange] {
        var decreasingSelf = self
        var ranges: [NSRange] = []
        
        while let subStringRange = decreasingSelf.range(of: string) {
            if let nsRange = toNSRange(for: subStringRange) {
                var variableNSRange = nsRange
                variableNSRange.location += utf16.count - decreasingSelf.utf16.count
                ranges.append(variableNSRange)
            }
            
            decreasingSelf.removeSubrange(subStringRange)
        }
        
        return ranges
    }
}
