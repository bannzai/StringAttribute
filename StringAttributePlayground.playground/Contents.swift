import UIKit
import StringAttribute

"StringAttribute\nis simple to write about NSAttributedString\nby bannzai\n"
    .attributed()
    .apply(.font(UIFont.boldSystemFont(ofSize: 30)))
    .apply(.font(UIFont(name: "Zapfino", size: 30)!), in: 0..<6)
    .apply(.font(UIFont.systemFont(ofSize: 30)), for: "Attribute", to: .first)
    .apply(.foregroundColor(.white))
    .apply(.foregroundColor(.cyan), for: "String", to: .all)
    .apply(.foregroundColor(.yellow), for: "t", to: .first)
    .apply(.foregroundColor(.red), for: "i", to: .first)
    .apply(.foregroundColor(.green), for: "b", to: .just(3))
    .apply([.underline(.single), .foregroundColor(.magenta)], for: "bannzai")
    .apply([.foregroundColor(.orange), .font(UIFont.boldSystemFont(ofSize: 40))], for: "write")
    .apply([
            .paragraph(.firstLineHeadIndent(450)),
            .font(UIFont(name: "Zapfino", size: 20)!)
        ],
        for: "by bannzai"
)

"Hello, \nworld".attributed()
    .apply(.paragraph(.complex([.alignment(.center), .lineSpacing(20)])))
    .apply(.paragraph(.headIndent(20)), for: "world")


"line space is 20px \nand this line head indent is 40px"
    .attributed()
    .apply(.paragraph(.lineSpacing(20)))
    .apply(.paragraph(.headIndent(300)), for: "and")

