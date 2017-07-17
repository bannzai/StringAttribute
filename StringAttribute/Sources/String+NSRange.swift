//
//  String+NSRange.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/15.
//  Copyright © 2017年 廣瀬雄大. All rights reserved.
//

import Foundation

extension String {
    func ranges(of string: String) -> [Range<Int>] {
        var decreasingSelf = self
        var ranges: [Range<Int>] = []
        
        while let subStringRange = decreasingSelf.range(of: string) {
            print("lower: \(subStringRange.lowerBound)")
            print("upper: \(subStringRange.upperBound)")
            let range: Range<Int> = Range(
                uncheckedBounds: (
                    lower: characters.distance(from: characters.startIndex, to: subStringRange.lowerBound),
                    upper: characters.distance(from: characters.startIndex, to: subStringRange.upperBound)
                )
            )
            ranges.append(range)
            
            decreasingSelf.removeSubrange(subStringRange)
        }
        
        return ranges
    }
}
