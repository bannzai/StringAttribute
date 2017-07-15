//
//  ParagraphStyle.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/14.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation

public enum ParagraphStyle {
    case lineSpacing(CGFloat)
    case paragraphSpacing(CGFloat)
    case alignment(NSTextAlignment)
    case firstLineHeadIndent(CGFloat)
    case headIndent(CGFloat)
    case tailIndent(CGFloat)
    case lineBreakMode(NSLineBreakMode)
    case minimumLineHeight(CGFloat)
    case maximumLineHeight(CGFloat)
    case baseWritingDirection(NSWritingDirection)
    case lineHeightMultiple(CGFloat)
    case paragraphSpacingBefore(CGFloat)
    case hyphenationFactor(Float)
    
    indirect case complex([ParagraphStyle])
    
    public func style() -> NSParagraphStyle {
        return ParagraphStyleBuilder().append(for: self).build()
    }
}

