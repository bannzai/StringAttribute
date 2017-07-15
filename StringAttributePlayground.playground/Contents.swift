//: Playground - noun: a place where people can play

import UIKit
import StringAttribute

var str = "Hello, playground"

let paragraphStyle = ParagraphStyle(
"Hello, playground\n Yeaaaa"
    .attributed()
    .apply(with: .font(.boldSystemFont(ofSize: 23)))
    .apply(with: .foregroundColor(.red))


"Hello playgrounds, Hello world"
    .attributed()
    .apply(with: .foregroundColor(.blue), for: "Hello", to: .all)
    .apply(with: .foregroundColor(.red), for: "Hello", to: .last)


