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
        .foregroundColor(#colorLiteral(red: 0.7803921569, green: 0.01960784314, blue: 0.02352941176, alpha: 1)),
        .strokeColor(.white),
        .strokeWidth(-3),
        .font(UIFont(name: "AmericanTypewriter-CondensedBold", size: 40.0)!),
        .kern(-2),
        .obliqueness(0.4)
        ]
    )
    .apply(with: .font(UIFont(name: "AmericanTypewriter-CondensedBold", size: 50.0)!), for: "19,")
    .apply(with: .kern(7.0), for: "0", to : .last)
    .apply(with: .font(UIFont(name: "HiraginoSans-W6", size: 25.0)!), for: "円")
    .apply(with: .obliqueness(0.0), for: "円")




let attributedString = NSMutableAttributedString(string: "19,800円")
let baseAttributes: [String: Any] =  [
    NSForegroundColorAttributeName: #colorLiteral(red: 0.7803921569, green: 0.01960784314, blue: 0.02352941176, alpha: 1),
    NSStrokeColorAttributeName: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),
    NSStrokeWidthAttributeName: -3.0,
    NSShadowAttributeName: shadow,
    NSFontAttributeName: UIFont(name: "AmericanTypewriter-CondensedBold", size: 40.0)!,
    NSKernAttributeName: -2.0,
    NSObliquenessAttributeName: 0.4
    
]

attributedString.addAttributes(
    baseAttributes,
    range: NSRange(location: 0, length: attributedString.length)
)
attributedString.addAttributes([NSFontAttributeName: UIFont(name: "AmericanTypewriter-CondensedBold", size: 50.0)!], range: NSRange(location: 0, length: 3))
attributedString.addAttributes([NSKernAttributeName: 100.0], range: NSRange(location: 5, length: 2))
attributedString.addAttributes([NSFontAttributeName: UIFont(name: "HiraginoSans-W6", size: 25.0)!, NSObliquenessAttributeName: 0.0], range: NSRange(location: 6, length: 1))


attributedString







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
