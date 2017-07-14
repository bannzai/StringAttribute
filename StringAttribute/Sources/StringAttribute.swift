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
    case paragraph(Paragraphable)
    case foregroundColor(UIColor)
    case backgroundColor(UIColor)
    case ligature(Float) // to NSNumber
    case kern(Float) // to NSNumber
    case strikethrough(NSUnderlineStyle) // to NSNumber
    case underline(NSUnderlineStyle) // to NSNumber
    case strokeColor(UIColor)
    case strokeWidth(Float)
    case shadow(NSShadow)
    case textEffect // is only NSTextEffectLetterpressStyle
    case attachment(NSAttributedString)
    case link(URL)
    case baselineOffset(Float) // to NSNumber
    case underlineColor(UIColor)
    case strikethroughColor(UIColor)
    case obliqueness(Float) // to NSNumber
    case expansion(Float) // to NSNumber
    case writingDirection(Int) // to NSNumber
    //    case verticalGlyphForm // ios is not working, key is NSVerticalGlyphFormAttributeName
    
    var key: String {
        switch self {
        case .font:
            return NSFontAttributeName
        case .paragraph:
            return NSParagraphStyleAttributeName
        case .foregroundColor:
            return NSForegroundColorAttributeName
        case .backgroundColor:
            return NSBackgroundColorAttributeName
        case .ligature:
            return NSLigatureAttributeName
        case .kern:
            return NSKernAttributeName
        case .strikethrough:
            return NSStrikethroughStyleAttributeName
        case .underline:
            return NSUnderlineStyleAttributeName
        case .strokeColor:
            return NSStrokeColorAttributeName
        case .strokeWidth:
            return NSStrokeWidthAttributeName
        case .shadow:
            return NSShadowAttributeName
        case .textEffect:
            return NSTextEffectAttributeName
        case .attachment:
            return NSAttachmentAttributeName
        case .link:
            return NSLinkAttributeName
        case .baselineOffset:
            return NSBaselineOffsetAttributeName
        case .underlineColor:
            return NSUnderlineColorAttributeName
        case .strikethroughColor:
            return NSStrikethroughColorAttributeName
        case .obliqueness:
            return NSObliquenessAttributeName
        case .expansion:
            return NSExpansionAttributeName
        case .writingDirection:
            return NSWritingDirectionAttributeName
        }
    }
    
    var attributes: [String: Any] {
        switch self {
        case .font(let font):
            return [key: font]
        case .paragraph(let paragraph):
            return [key: paragraph]
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
