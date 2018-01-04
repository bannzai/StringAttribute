//
//  StringAttribute.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/14.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import UIKit

public enum StringAttribute {
    case font(UIFont)
    case paragraph(ParagraphStyle)
    case foregroundColor(UIColor)
    case backgroundColor(UIColor)
    case ligature(Float) 
    case kern(Float) 
    case strikethrough(NSUnderlineStyle)
    case underline(NSUnderlineStyle) 
    case strokeColor(UIColor)
    case strokeWidth(Float)
    case shadow(NSShadow)
    case textEffect(NSString)
    case attachment(NSAttributedString)
    case link(URL)
    case baselineOffset(Float) 
    case underlineColor(UIColor)
    case strikethroughColor(UIColor)
    case obliqueness(Float) 
    case expansion(Float) 
    case writingDirection(Int)
    
    public var stringKey: String {
        return key.rawValue
    }
    
    public var key: NSAttributedStringKey {
        switch self {
        case .font:
            return NSAttributedStringKey.font
        case .paragraph:
            return NSAttributedStringKey.paragraphStyle
        case .foregroundColor:
            return NSAttributedStringKey.foregroundColor
        case .backgroundColor:
            return NSAttributedStringKey.backgroundColor
        case .ligature:
            return NSAttributedStringKey.ligature
        case .kern:
            return NSAttributedStringKey.kern
        case .strikethrough:
            return NSAttributedStringKey.strikethroughColor
        case .underline:
            return NSAttributedStringKey.underlineStyle
        case .strokeColor:
            return NSAttributedStringKey.strokeColor
        case .strokeWidth:
            return NSAttributedStringKey.strokeWidth
        case .shadow:
            return NSAttributedStringKey.shadow
        case .textEffect:
            return NSAttributedStringKey.textEffect
        case .attachment:
            return NSAttributedStringKey.attachment
        case .link:
            return NSAttributedStringKey.link
        case .baselineOffset:
            return NSAttributedStringKey.baselineOffset
        case .underlineColor:
            return NSAttributedStringKey.underlineColor
        case .strikethroughColor:
            return NSAttributedStringKey.strikethroughColor
        case .obliqueness:
            return NSAttributedStringKey.obliqueness
        case .expansion:
            return NSAttributedStringKey.expansion
        case .writingDirection:
            return NSAttributedStringKey.writingDirection
        }
    }
    
    public var attributes: [NSAttributedStringKey: Any] {
        switch self {
        case .font(let font):
            return [key: font]
        case .paragraph(let paragraph):
            return [key: paragraph.style()]
        case .foregroundColor(let foregroundColor):
            return [key: foregroundColor]
        case .backgroundColor(let backgroundColor):
            return [key: backgroundColor]
        case .ligature(let ligature):
            return [key: NSNumber(value: ligature)]
        case .kern(let kern):
            return [key: NSNumber(value: kern)]
        case .strikethrough(let strikethrough):
            return [key: NSNumber(integerLiteral: strikethrough.rawValue)]
        case .underline(let underline):
            return [key: NSNumber(integerLiteral: underline.rawValue)]
        case .strokeColor(let strokeColor):
            return [key: strokeColor]
        case .strokeWidth(let strokeWidth):
            return [key: strokeWidth]
        case .shadow(let shadow):
            return [key: shadow]
        case .textEffect(let textEffect):
            return [key: textEffect]
        case .attachment(let attachment):
            return [key: attachment]
        case .link(let link):
            return [key: link]
        case .baselineOffset(let baselineOffset):
            return [key: NSNumber(value: baselineOffset)]
        case .underlineColor(let underlineColor):
            return [key: underlineColor]
        case .strikethroughColor(let strikethroughColor):
            return [key: strikethroughColor]
        case .obliqueness(let obliqueness):
            return [key: NSNumber(value: obliqueness)]
        case .expansion(let expansion):
            return [key: NSNumber(value: expansion)]
        case .writingDirection(let writingDirection):
            return [key: writingDirection]
        }
    }
}
