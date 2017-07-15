//: Playground - noun: a place where people can play

import UIKit
import StringAttribute

var str = "Hello, playground"

"Hello, playground"
    .attributed()
    .apply(with: .font(.boldSystemFont(ofSize: 15)))
    .apply(with: .foregroundColor(.red))

