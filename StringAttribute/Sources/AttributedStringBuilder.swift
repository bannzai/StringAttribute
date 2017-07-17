//
//  StringAttribute.swift
//  StringAttribute
//
//  Created by Hirose.Yudai on 2017/07/11.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation
import UIKit

public class AttributedStringBuilder {
    fileprivate let attributedString: NSAttributedString
    
    fileprivate var styleAndRangePairs: [(style: StringAttribute, range: Range<Int>)] = []
    
    public var string: String {
        return attributedString.string
    }
    
    public init(string: String) {
        attributedString = NSAttributedString(string: string)
    }
    
    public init(attributedString: NSAttributedString) {
        self.attributedString = attributedString
    }
    
    public func apply(with attribute: StringAttribute) -> AttributedStringBuilder {
        return apply(with: attribute, in: Range(uncheckedBounds: (lower: 0, upper: attributedString.length)))
    }
    
    public func apply(with attributes: [StringAttribute]) -> AttributedStringBuilder {
        return apply(with: attributes, in: Range(uncheckedBounds: (lower: 0, upper: attributedString.length)))
    }
    
    public func apply(with attribute: StringAttribute, in range: Range<Int>) -> AttributedStringBuilder {
        styleAndRangePairs.append((style: attribute, range: range))
        return self
    }
    
    public func apply(with attributes: [StringAttribute], in range: Range<Int>) -> AttributedStringBuilder {
        attributes.forEach { _ = apply(with: $0, in: range) }
        return self
    }
    
    public func apply(with attribute: StringAttribute, in countableRange: CountableRange<Int>) -> AttributedStringBuilder {
        let range: Range<Int> = Range(uncheckedBounds: (countableRange.lowerBound, countableRange.upperBound))
        return apply(with: attribute, in: range)
    }
    
    public func apply(with attributes: [StringAttribute], in countableRange: CountableRange<Int>) -> AttributedStringBuilder {
        let range: Range<Int> = Range(uncheckedBounds: (countableRange.lowerBound, countableRange.upperBound))
        return apply(with: attributes, in: range)
    }
    
    public func apply(with attribute: StringAttribute, in closeRange: ClosedRange<Int>) -> AttributedStringBuilder {
        let range: Range<Int> = Range(uncheckedBounds: (closeRange.lowerBound, closeRange.upperBound))
        return apply(with: attribute, in: range)
    }
    
    public func apply(with attributes: [StringAttribute], in closeRange: ClosedRange<Int>) -> AttributedStringBuilder {
        let range: Range<Int> = Range(uncheckedBounds: (closeRange.lowerBound, closeRange.upperBound))
        return apply(with: attributes, in: range)
    }
    
    public func apply(with attribute: StringAttribute, for string: String, to position: StringMatchPositionType) -> AttributedStringBuilder {
        position
            .convertRanges(
                from: attributedString.string.ranges(of: string)
            )
            .forEach { (range) in
                _ = apply(with: attribute, in: range)
        }
        return self
    }
    
    public func apply(with attributes: [StringAttribute], for string: String, to position: StringMatchPositionType) -> AttributedStringBuilder {
        attributes.forEach {
            _ = apply(with: $0, for: string, to: position)
        }
        return self
    }
    
    public func build() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self.attributedString)
        
        styleAndRangePairs.forEach {
            attributedString.addAttributes($0.style.attributes, range: toNSRange(from: $0.range))
        }
        
        return attributedString
    }
    
    private func toNSRange(from range: Range<Int>) -> NSRange {
        return NSRange(
            location: range.lowerBound,
            length: range.upperBound
        )
    }
    
}

