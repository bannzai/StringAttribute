//
//  NSAttributedString+StringAttributeBuilder.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/14.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation

public extension NSAttributedString {
    public func apply(for attribute: StringAttribute) -> NSAttributedString {
        return apply(for: attribute, in: Range(uncheckedBounds: (lower: 0, upper: length)))
    }
    
    public func apply(for attributes: [StringAttribute]) -> NSAttributedString {
        return apply(for: attributes, in: Range(uncheckedBounds: (lower: 0, upper: length)))
    }
    
    public func apply(for attribute: StringAttribute, in range: Range<Int>) -> NSAttributedString {
        return StringAttributeBuilder(attributedString: self).apply(for: attribute, in: range).build()
    }
    
    public func apply(for attributes: [StringAttribute], in range: Range<Int>) -> NSAttributedString {
        return StringAttributeBuilder(attributedString: self).apply(for: attributes, in: range).build()
    }
}
