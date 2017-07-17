# StringAttribute
`StringAttribute` is simple to write about NSAttributedString.

<img width="800px" src="https://user-images.githubusercontent.com/10897361/28266380-7bd5a544-6b2f-11e7-9db0-9df78b33c0b6.png" />

# Usage
You can write like the one below.

- Initialize attributed string

```swift
 "Hello, world".attributed() // NSAttributedString
```

- Attach attributes with method chain

```swift
label.attributedText = "Hello, world".attributed()
    .apply(with: .foregroundColor(.white)) // All text to be white color
    .apply(with: .foregroundColor(.blue), in: 0..<5) // "Hello" to be blue color
    .apply(with: [.font(UIFont.boldSystemFont(ofSize: 20)), .foregroundColor(.red)], for: "world") // "world" is to be Bold font and red color
```

- Attach paragraph style with method chain

```swift
label.attributedText = "Hello, \nworld".attributed()
    .apply(with: .paragraph(.complex([.alignment(.center), .lineSpacing(20)]))) // All line text alignment is center and line space is 20.
    .apply(with: .paragraph(.headIndent(20)), for: "world")  // Containing "world", the head indent of line is 20px
```

# TODO
- [ ] Write test  
- [ ] Add demo project  
- [ ] Add playground sample
- [ ] CocoaPods
- [ ] Carthage

# License 
**StringAttribute** is available under the **MIT** license. See the LICENSE file for more info.
