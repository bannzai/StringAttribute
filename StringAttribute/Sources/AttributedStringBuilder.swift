//
//  StringAttribute.swift
//  StringAttribute
//
//  Created by Hirose.Yudai on 2017/07/11.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation
import UIKit

public struct AttributedStringBuilder {
    fileprivate let attributedString: NSMutableAttributedString
    
    public init(string: String) {
        attributedString = NSMutableAttributedString(string: string)
    }
    
    public init(attributedString: NSAttributedString) {
        self.attributedString = NSMutableAttributedString(attributedString: attributedString)
    }
    
    
    @discardableResult
    public func apply(_ attribute: StringAttribute) -> AttributedStringBuilder {
        return apply(with: attribute, in: Range(uncheckedBounds: (lower: 0, upper: attributedString.length)))
    }
    
    @discardableResult
    public func apply(_ attributes: [StringAttribute]) -> AttributedStringBuilder {
        return apply(with: attributes, in: Range(uncheckedBounds: (lower: 0, upper: attributedString.length)))
    }
    
    @discardableResult
    public func apply(_ attribute: StringAttribute, in range: Range<Int>) -> AttributedStringBuilder {
        let nsRange = NSMakeRange(range.lowerBound, range.upperBound - range.lowerBound)
        attributedString.addAttributes(attribute.attributes, range: nsRange)
        return self
    }
    
    @discardableResult
    public func apply(_ attributes: [StringAttribute], in range: Range<Int>) -> AttributedStringBuilder {
        let nsRange = NSMakeRange(range.lowerBound, range.upperBound - range.lowerBound)
        attributes.forEach { attributedString.addAttributes($0.attributes, range: nsRange) }
        return self
    }
    
    @discardableResult
    public func apply(_ attribute: StringAttribute, in countableRange: CountableRange<Int>) -> AttributedStringBuilder {
        let range: Range<Int> = Range(uncheckedBounds: (countableRange.lowerBound, countableRange.upperBound))
        return apply(with: attribute, in: range)
    }
    
    @discardableResult
    public func apply(_ attributes: [StringAttribute], in countableRange: CountableRange<Int>) -> AttributedStringBuilder {
        let range: Range<Int> = Range(uncheckedBounds: (countableRange.lowerBound, countableRange.upperBound))
        return apply(with: attributes, in: range)
    }
    
    @discardableResult
    public func apply(_ attribute: StringAttribute, in closeRange: ClosedRange<Int>) -> AttributedStringBuilder {
        let range: Range<Int> = Range(uncheckedBounds: (closeRange.lowerBound, closeRange.upperBound))
        return apply(with: attribute, in: range)
    }
    
    @discardableResult
    public func apply(_ attributes: [StringAttribute], in closeRange: ClosedRange<Int>) -> AttributedStringBuilder {
        let range: Range<Int> = Range(uncheckedBounds: (closeRange.lowerBound, closeRange.upperBound))
        return apply(with: attributes, in: range)
    }
    
    @discardableResult
    public func apply(_ attribute: StringAttribute, for string: String, to position: StringMatchPositionType) -> AttributedStringBuilder {
        position
            .convertRanges(
                from: attributedString.string.ranges(of: string)
            )
            .forEach { (range) in
                attributedString.addAttributes(attribute.attributes, range: range)
        }
        return self
    }
    
    @discardableResult
    public func apply(_ attributes: [StringAttribute], for string: String, to position: StringMatchPositionType) -> AttributedStringBuilder {
        attributes.forEach {
            _ = apply(with: $0, for: string, to: position)
        }
        return self
    }
    
    @discardableResult
    public func append(with image: UIImage?, bounds: CGRect = .zero) -> AttributedStringBuilder {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = bounds
        
        attributedString.append(NSAttributedString(attachment: attachment))
        
        return self
    }
    
    public func insert(with image: UIImage?, bounds: CGRect = .zero, at index: Int) -> AttributedStringBuilder {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = bounds
        
        attributedString.insert(NSAttributedString(attachment: attachment), at: index)
        
        return self
    }
    
    public func build() -> NSAttributedString {
        return attributedString
    }
}

