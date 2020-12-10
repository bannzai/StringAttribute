//
//  NSAttributedString+AttributedStringBuilder.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/14.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    public func apply(_ attribute: StringAttribute) -> NSAttributedString {
        return apply(with: attribute, in: Range(uncheckedBounds: (lower: 0, upper: length)))
    }
    
    public func apply(_ attributes: [StringAttribute]) -> NSAttributedString {
        return apply(with: attributes, in: Range(uncheckedBounds: (lower: 0, upper: length)))
    }
    
    public func apply(_ attribute: StringAttribute, in range: Range<Int>) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).apply(with: attribute, in: range).build()
    }
    
    public func apply(_ attributes: [StringAttribute], in range: Range<Int>) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).apply(with: attributes, in: range).build()
    }
    
    public func apply(_ attribute: StringAttribute, in range: CountableRange<Int>) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).apply(with: attribute, in: range).build()
    }
    
    public func apply(_ attributes: [StringAttribute], in range: CountableRange<Int>) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).apply(with: attributes, in: range).build()
    }
    
    public func apply(_ attribute: StringAttribute, in range: ClosedRange<Int>) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).apply(with: attribute, in: range).build()
    }
    
    public func apply(_ attributes: [StringAttribute], in range: ClosedRange<Int>) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).apply(with: attributes, in: range).build()
    }
    
    public func apply(_ attribute: StringAttribute, for string: String, to position: StringMatchPositionType = .all) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).apply(with: attribute, for: string, to: position).build()
    }
    
    public func apply(_ attributes: [StringAttribute], for string: String, to position: StringMatchPositionType = .all) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).apply(with: attributes, for: string, to: position).build()
    }
}

public extension NSAttributedString {
    public func append(with image: UIImage?, bounds: CGRect = .zero) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).append(with: image, bounds: bounds).build()
    }
    
    public func insert(with image: UIImage?, bounds: CGRect = .zero, at index: Int) -> NSAttributedString {
        return AttributedStringBuilder(attributedString: self).insert(with: image, bounds: bounds, at: index).build()
    }
}
