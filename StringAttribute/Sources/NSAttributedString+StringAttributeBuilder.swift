//
//  NSAttributedString+StringAttributeBuilder.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/14.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    public func apply(with attribute: StringAttribute) -> NSAttributedString {
        return apply(with: attribute, in: Range(uncheckedBounds: (lower: 0, upper: length)))
    }
    
    public func apply(with attributes: [StringAttribute]) -> NSAttributedString {
        return apply(with: attributes, in: Range(uncheckedBounds: (lower: 0, upper: length)))
    }
    
    public func apply(with attribute: StringAttribute, in range: Range<Int>) -> NSAttributedString {
        return StringAttributeBuilder(attributedString: self).apply(with: attribute, in: range).build()
    }
    
    public func apply(with attributes: [StringAttribute], in range: Range<Int>) -> NSAttributedString {
        return StringAttributeBuilder(attributedString: self).apply(with: attributes, in: range).build()
    }
}
