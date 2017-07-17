//: Playground - noun: a place where people can play

import UIKit
import StringAttribute

"StringAttribute\nis simple to write for NSAttributedString\nby bannzai\n"
    .attributed()
    .apply(with: .font(UIFont.boldSystemFont(ofSize: 30)))
    .apply(with: .font(UIFont(name: "Zapfino", size: 30)!), in: 0..<6)
    .apply(with: .font(UIFont.systemFont(ofSize: 30)), for: "Attribute", to: .first)
    .apply(with: .foregroundColor(.white))
    .apply(with: .foregroundColor(.cyan), for: "String", to: .all)
    .apply(with: .foregroundColor(.red), for: "i", to: .first)
    .apply(with: .foregroundColor(.yellow), for: "t", to: .first)
    .apply(with: .foregroundColor(.green), for: "b", to: .just(2))
    .apply(with: .foregroundColor(.magenta), for: "b", to: .last)
    .apply(with: [.foregroundColor(.orange), .font(UIFont.boldSystemFont(ofSize: 40))], for: "write")
    .apply(
        with: [
            .paragraph(.firstLineHeadIndent(450)),
            .font(UIFont(name: "Zapfino", size: 20)!)
        ],
        for: "by bannzai"
)

"Hello, \nworld".attributed()
    .apply(with: .paragraph(.complex([.alignment(.center), .lineSpacing(20)])))
    .apply(with: .paragraph(.headIndent(20)), for: "world")




