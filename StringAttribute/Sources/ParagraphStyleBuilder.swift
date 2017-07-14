//
//  ParagraphStyleBuilder.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/14.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import UIKit

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
