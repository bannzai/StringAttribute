//
//  Paragraph.swift
//  StringAttributeBuilder
//
//  Created by Yudai.Hirose on 2017/07/14.
//  Copyright © 2017年 Hirose.Yudai. All rights reserved.
//

import Foundation

public struct Paragraph {
    public let styles: [ParagraphStyle]
    public init(styles: [ParagraphStyle]) {
       self.styles = styles
    }
}
