//: Playground - noun: a place where people can play

import UIKit
import StringAttribute

let shadow = NSShadow()
shadow.shadowOffset = CGSize(width: 5, height: 5)
shadow.shadowBlurRadius = 5

"19,800円"
    .attributed()
    .apply(with: [
        .shadow(shadow),
        .foregroundColor(UIColor(colorLiteralRed: 0.7, green: 0.2, blue: 0.23, alpha: 1)),
        .strokeColor(.black),
        .strokeWidth(-3),
        .font(UIFont(name: "AmericanTypewriter-CondensedBold", size: 40.0)!),
        .kern(-2),
        .obliqueness(0.4)
        ]
    )
    .apply(with: .font(UIFont(name: "AmericanTypewriter-CondensedBold", size: 40.0)!), for: "19,")
    .apply(with: .kern(7), in: 5..<7)
    .apply(with: .font(UIFont(name: "HiraginoSans-W6", size: 25.0)!), for: "円")

"StringAttribute\nis simple to write about NSAttributedString\nby bannzai\n"
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





"line space is 20px \nand this line head indent is 40px"
    .attributed()
    .apply(with: .paragraph(.lineSpacing(20)))
    .apply(with: .paragraph(.headIndent(300)), for: "and")
