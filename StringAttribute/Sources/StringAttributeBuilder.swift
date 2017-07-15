//
//  StringAttribute.swift
//  StringAttribute
//
//  Created by Hirose.Yudai on 2017/07/11.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation
import UIKit

// reference to
// https://thinkit.co.jp/story/2014/09/30/5204
// http://qiita.com/inuscript/items/fdfa69515e74506134a3
// http://tea-leaves.jp/home/ja/article/1374929836



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
    
    public func build() -> NSAttributedString {
        return attributedString
    }
}

