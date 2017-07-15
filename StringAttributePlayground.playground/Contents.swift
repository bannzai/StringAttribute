//: Playground - noun: a place where people can play

import UIKit
import StringAttribute

var str = "Hello, playground"

"Hello, playground"
    .attributed()
    .apply(with: .font(.boldSystemFont(ofSize: 15)))
    .apply(with: .foregroundColor(.red))


//"Hello playgrounds, Hello world"
//    .attributed()
//    .apply(with: .foregroundColor(.blue), for: "Hello", to: .all)



extension String {
    private func toNSRange(for range: Range<String.Index>) -> NSRange {
        let lower = String.UTF16View.Index(range.lowerBound, within: utf16)
        let upper = String.UTF16View.Index(range.upperBound, within: utf16)
        return NSRange(
            location: utf16.startIndex.distance(to: lower),
            length: utf16.distance(from: lower, to: upper)
        )
    }
    
    func ranges(of string: String) -> [NSRange] {
        var decreasingSelf = self
        var ranges: [NSRange] = []
        
        while let subStringRange = decreasingSelf.range(of: string) {
            var nsRange = toNSRange(for: subStringRange)
            nsRange.location += utf16.count - decreasingSelf.utf16.count
            ranges.append(nsRange)
            
            decreasingSelf.removeSubrange(subStringRange)
        }
        
        return ranges
    }
}
let range = "Hello playgrounds, Hello world".ranges(of: "Hello")
range.forEach { print($0.location) }
