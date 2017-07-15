//
//  StringAttribute.swift
//  StringAttribute
//
//  Created by Hirose.Yudai on 2017/07/11.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation
import UIKit

public struct StringAttributeBuilder {
    fileprivate let attributedString: NSMutableAttributedString
    
    public init(string: String) {
        attributedString = NSMutableAttributedString(string: string)
    }
    
    public init(attributedString: NSAttributedString) {
        self.attributedString = NSMutableAttributedString(attributedString: attributedString)
    }
    
    public func apply(with attribute: StringAttribute) -> StringAttributeBuilder {
        return apply(with: attribute, in: Range(uncheckedBounds: (lower: 0, upper: attributedString.length)))
    }
    
    public func apply(with attributes: [StringAttribute]) -> StringAttributeBuilder {
        return apply(with: attributes, in: Range(uncheckedBounds: (lower: 0, upper: attributedString.length)))
    }
    
    public func apply(with attribute: StringAttribute, in range: Range<Int>) -> StringAttributeBuilder {
        let nsRange = NSMakeRange(range.lowerBound, range.upperBound - range.lowerBound)
        attributedString.addAttributes(attribute.attributes, range: nsRange)
        return self
    }
    
    public func apply(with attributes: [StringAttribute], in range: Range<Int>) -> StringAttributeBuilder {
        let nsRange = NSMakeRange(range.lowerBound, range.upperBound - range.lowerBound)
        attributes.forEach { attributedString.addAttributes($0.attributes, range: nsRange) }
        return self
    }
    
    public func apply(with attribute: StringAttribute, for string: String, to position: StringMatchPositionType) -> StringAttributeBuilder {
        position
            .convertRanges(
                from: attributedString.string.ranges(of: string)
            )
            .forEach { (range) in
                attributedString.addAttributes(attribute.attributes, range: range)
        }
        return self
    }
    
    public func apply(with attributes: [StringAttribute], for string: String, to position: StringMatchPositionType) -> StringAttributeBuilder {
        attributes.forEach {
            _ = apply(with: $0, for: string, to: position)
        }
        return self
    }
    
    public func build() -> NSAttributedString {
        return attributedString
    }
}

