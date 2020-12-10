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
    
    public var key: NSAttributedString.Key {
        switch self {
        case .font:
            return NSAttributedString.Key.font
        case .paragraph:
            return NSAttributedString.Key.paragraphStyle
        case .foregroundColor:
            return NSAttributedString.Key.foregroundColor
        case .backgroundColor:
            return NSAttributedString.Key.backgroundColor
        case .ligature:
            return NSAttributedString.Key.ligature
        case .kern:
            return NSAttributedString.Key.kern
        case .strikethrough:
            return NSAttributedString.Key.strikethroughColor
        case .underline:
            return NSAttributedString.Key.underlineStyle
        case .strokeColor:
            return NSAttributedString.Key.strokeColor
        case .strokeWidth:
            return NSAttributedString.Key.strokeWidth
        case .shadow:
            return NSAttributedString.Key.shadow
        case .textEffect:
            return NSAttributedString.Key.textEffect
        case .attachment:
            return NSAttributedString.Key.attachment
        case .link:
            return NSAttributedString.Key.link
        case .baselineOffset:
            return NSAttributedString.Key.baselineOffset
        case .underlineColor:
            return NSAttributedString.Key.underlineColor
        case .strikethroughColor:
            return NSAttributedString.Key.strikethroughColor
        case .obliqueness:
            return NSAttributedString.Key.obliqueness
        case .expansion:
            return NSAttributedString.Key.expansion
        case .writingDirection:
            return NSAttributedString.Key.writingDirection
        }
    }
    
    public var attributesForStringKey: [String: Any] {
        switch self {
        case .font(let font):
            return [key.rawValue: font]
        case .paragraph(let paragraph):
            return [key.rawValue: paragraph.style()]
        case .foregroundColor(let foregroundColor):
            return [key.rawValue: foregroundColor]
        case .backgroundColor(let backgroundColor):
            return [key.rawValue: backgroundColor]
        case .ligature(let ligature):
            return [key.rawValue: NSNumber(value: ligature)]
        case .kern(let kern):
            return [key.rawValue: NSNumber(value: kern)]
        case .strikethrough(let strikethrough):
            return [key.rawValue: NSNumber(integerLiteral: strikethrough.rawValue)]
        case .underline(let underline):
            return [key.rawValue: NSNumber(integerLiteral: underline.rawValue)]
        case .strokeColor(let strokeColor):
            return [key.rawValue: strokeColor]
        case .strokeWidth(let strokeWidth):
            return [key.rawValue: strokeWidth]
        case .shadow(let shadow):
            return [key.rawValue: shadow]
        case .textEffect(let textEffect):
            return [key.rawValue: textEffect]
        case .attachment(let attachment):
            return [key.rawValue: attachment]
        case .link(let link):
            return [key.rawValue: link]
        case .baselineOffset(let baselineOffset):
            return [key.rawValue: NSNumber(value: baselineOffset)]
        case .underlineColor(let underlineColor):
            return [key.rawValue: underlineColor]
        case .strikethroughColor(let strikethroughColor):
            return [key.rawValue: strikethroughColor]
        case .obliqueness(let obliqueness):
            return [key.rawValue: NSNumber(value: obliqueness)]
        case .expansion(let expansion):
            return [key.rawValue: NSNumber(value: expansion)]
        case .writingDirection(let writingDirection):
            return [key.rawValue: writingDirection]
        }
    }
    
    public var attributes: [NSAttributedString.Key: Any] {
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
