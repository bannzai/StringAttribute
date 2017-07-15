//
//  StringMatchPositionType.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/15.
//  Copyright © 2017年 Yudai.Hirose. All rights reserved.
//

import Foundation

public enum StringMatchPositionType {
    case first
    case last
    case just(Int)
    case between(Range<Int>)
    case all
    
    func convertRanges(from ranges: [NSRange]) -> [NSRange] {
        switch self {
        case .first:
            return [ranges.first!]
        case .last:
            return [ranges.last!]
        case .just(let position):
            return [ranges[position]]
        case .between(let range):
            return Array(ranges[range])
        case .all:
            return ranges
        }
    }
}
