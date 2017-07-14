//
//  Paragraphable.swift
//  StringAttribute
//
//  Created by Yudai.Hirose on 2017/07/14.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation

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

