//
//  StringAttributeBuilder.swift
//  StringAttributeBuilder
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

public struct Paragraph {
    public let styles: [ParagraphStyle]
    public init(styles: [ParagraphStyle]) {
       self.styles = styles
    }
}

public protocol Paragraphable {
    func style() -> NSParagraphStyle
}

extension NSParagraphStyle: Paragraphable {
    public func style() -> NSParagraphStyle {
        return self
    }
}
extension Paragraph: Paragraphable {
    public func style() -> NSParagraphStyle {
        return ParagraphStyleBuilder().append(for: styles).build()
    }
}


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
}

public struct ParagraphStyleBuilder {
    fileprivate let paragraphStyle: NSMutableParagraphStyle
    
    public init(style: NSParagraphStyle? = nil) {
        switch style {
        case .none:
            paragraphStyle = NSMutableParagraphStyle()
        case .some(let style):
            let mutableParagraphStyle = NSMutableParagraphStyle()
            mutableParagraphStyle.setParagraphStyle(style)
            self.paragraphStyle = mutableParagraphStyle
        }
    }
    
    public func append(for style: ParagraphStyle) -> ParagraphStyleBuilder {
        return append(for: [style])
    }
    
    public func append(for styles: [ParagraphStyle]) -> ParagraphStyleBuilder {
        styles.forEach { style in
            switch style {
            case .lineSpacing(let lineSpacing):
                paragraphStyle.lineSpacing = lineSpacing
            case .paragraphSpacing(let paragraphSpacing):
                paragraphStyle.paragraphSpacing = paragraphSpacing
            case .alignment(let alignment):
                paragraphStyle.alignment = alignment
            case .firstLineHeadIndent(let firstLineHeadIndent):
                paragraphStyle.firstLineHeadIndent = firstLineHeadIndent
            case .headIndent(let headIndent):
                paragraphStyle.headIndent = headIndent
            case .tailIndent(let tailIndent):
                paragraphStyle.tailIndent = tailIndent
            case .lineBreakMode(let lineBreakMode):
                paragraphStyle.lineBreakMode = lineBreakMode
            case .minimumLineHeight(let minimumLineHeight):
                paragraphStyle.minimumLineHeight = minimumLineHeight
            case .maximumLineHeight(let maximumLineHeight):
                paragraphStyle.maximumLineHeight = maximumLineHeight
            case .baseWritingDirection(let baseWritingDirection):
                paragraphStyle.baseWritingDirection = baseWritingDirection
            case .lineHeightMultiple(let lineHeightMultiple):
                paragraphStyle.lineHeightMultiple = lineHeightMultiple
            case .paragraphSpacingBefore(let paragraphSpacingBefore):
                paragraphStyle.paragraphSpacingBefore = paragraphSpacingBefore
            case .hyphenationFactor(let hyphenationFactor):
                paragraphStyle.hyphenationFactor = hyphenationFactor
            }
        }
        return self
    }
    
    public func build() -> NSMutableParagraphStyle {
        return paragraphStyle
    }
}

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

public extension String {
    public func attributed() -> NSAttributedString {
        return NSAttributedString(string: self)
    }
}

public struct StringAttributeBuilder {
    fileprivate let attributedString: NSMutableAttributedString
    
    public init(string: String) {
        attributedString = NSMutableAttributedString(string: string)
    }
    
    public init(attributedString: NSAttributedString) {
        self.attributedString = NSMutableAttributedString(attributedString: attributedString)
    }
    
    public func apply(for attribute: StringAttribute) -> StringAttributeBuilder {
        return apply(for: attribute, in: Range(uncheckedBounds: (lower: 0, upper: attributedString.length)))
    }
    
    public func apply(for attributes: [StringAttribute]) -> StringAttributeBuilder {
        return apply(for: attributes, in: Range(uncheckedBounds: (lower: 0, upper: attributedString.length)))
    }
    
    public func apply(for attribute: StringAttribute, in range: Range<Int>) -> StringAttributeBuilder {
        let nsRange = NSMakeRange(range.lowerBound, range.upperBound - range.lowerBound)
        attributedString.addAttributes(attribute.attributes, range: nsRange)
        return self
    }
    
    public func apply(for attributes: [StringAttribute], in range: Range<Int>) -> StringAttributeBuilder {
        let nsRange = NSMakeRange(range.lowerBound, range.upperBound - range.lowerBound)
        attributes.forEach { attributedString.addAttributes($0.attributes, range: nsRange) }
        return self
    }
    
    public func build() -> NSAttributedString {
        return attributedString
    }
}

