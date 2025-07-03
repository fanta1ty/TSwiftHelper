# TSwiftHelper

[![Platform](https://img.shields.io/cocoapods/p/TSwiftHelper)](https://cocoapods.org/pods/TSwiftHelper)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-brightgreen)](https://developer.apple.com/swift/)
[![Version](https://img.shields.io/badge/pod-1.1.6-informational)](https://cocoapods.org/?q=TSwiftHelper)
[![License](http://img.shields.io/badge/license-MIT-blue)](https://github.com/fanta1ty/TSwiftHelper/blob/master/LICENSE)
[![Email](https://img.shields.io/badge/contact-@thinhnguyen12389@gmail.com-blue)](thinhnguyen12389@gmail.com)

**TSwiftHelper** is a powerful and lightweight Swift library designed to accelerate iOS development with a comprehensive collection of helper classes and extension functions. It provides ready-to-use UI components and utilities that eliminate boilerplate code and enhance development productivity.

## ✨ Features

- **🎨 UI Component Helpers**: Pre-configured UI components with style management
- **📱 Native iOS Integration**: Seamless integration with iOS SDK
- **🔧 Utility Extensions**: Helpful extension functions for common development tasks
- **⚡ Performance Optimized**: Lightweight and efficient implementation
- **📋 Easy Configuration**: Simple and intuitive API design
- **🎯 Type Safe**: Leverages Swift's type system for safer code
- **📦 Multiple Installation Options**: CocoaPods, Swift Package Manager, and Manual

## 📋 Requirements

- **iOS**: 11.0+
- **Swift**: 5.0+
- **Xcode**: 11.0+

## 📦 Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to install TSwiftHelper. Add the following line to your `Podfile`:

```ruby
pod 'TSwiftHelper'
```

Then run:
```bash
pod install
```

### Swift Package Manager

Add TSwiftHelper to your project through Xcode's Package Manager:

1. File → Add Package Dependencies
2. Enter package URL: `https://github.com/fanta1ty/TSwiftHelper.git`
3. Select version and add to your target

Or add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/fanta1ty/TSwiftHelper.git", from: "master")
]
```

### Manual Installation

Simply drag and drop the files in the `TSwiftHelper/TSwiftHelper` folder into your project.

## 🚀 Quick Start

Import TSwiftHelper in your Swift files:

```swift
import TSwiftHelper
```

## 📖 Usage Guide

### 🏷️ LabelHelper

Create beautifully styled labels with minimal code:

```swift
let titleLabel = LabelHelper(
    style: LabelStyle(
        backgroundColor: .clear,
        borderColor: .clear,
        borderWidth: 0,
        cornerRadius: 0,
        textColor: .black,
        textFont: .regular(size: 16),
        textAlignment: .center,
        numberOfLines: 1,
        isHidden: false
    ),
    text: "Welcome to TSwiftHelper!"
)
```

### 🔘 ButtonHelper

Create interactive buttons with custom styling:

```swift
let actionButton = ButtonHelper(
    style: ButtonStyle(
        backgroundColor: .blue,
        borderColor: .black,
        borderWidth: 1,
        cornerRadius: 8,
        textColor: .white,
        textFont: .regular(size: 16),
        clipsToBounds: true,
        isHidden: false,
        isUserInteractionEnabled: true
    ),
    title: "Tap Me!",
    normalImage: "button_icon".uiImage,
    selectedImage: "button_icon_selected".uiImage
)
```

### 📝 TextFieldHelper

Create styled text input fields:

```swift
let usernameField = TextFieldHelper(
    style: TextFieldStyle(
        backgroundColor: .clear,
        borderColor: .black,
        borderWidth: 1,
        cornerRadius: 8,
        textColor: .black,
        textFont: .regular(size: 16),
        textAlignment: .left,
        keyboardType: .default,
        isSecureTextEntry: false,
        autocorrectionType: .default,
        spellCheckingType: .no,
        autocapitalizationType: .none,
        clearButtonMode: .never,
        isHidden: false,
        isUserInteractionEnabled: true
    ),
    text: "",
    placeholder: "Enter username"
)
```

### 🖼️ ViewHelper

Create custom views with styling:

```swift
let containerView = ViewHelper(
    style: ViewStyle(
        backgroundColor: .clear,
        borderColor: .clear,
        borderWidth: 0,
        cornerRadius: 0,
        clipsToBounds: true,
        isHidden: false,
        isUserInteractionEnabled: true
    )
)
```

### 🖼️ ImageViewHelper

Create styled image views:

```swift
let profileImageView = ImageViewHelper(
    style: ImageViewStyle(
        backgroundColor: .clear,
        borderColor: .black,
        borderWidth: 1,
        cornerRadius: 10,
        contentMode: .scaleAspectFill,
        clipsToBounds: true,
        isHidden: false
    ),
    iconImage: "profile_placeholder".uiImage
)
```

### 📋 TableViewHelper

Create configured table views with automatic cell registration:

```swift
let tableView = TableViewHelper(
    style: TableViewStyle(
        backgroundColor: .clear,
        borderColor: .clear,
        borderWidth: 0,
        cornerRadius: 0,
        clipsToBounds: true,
        isHidden: false,
        isUserInteractionEnabled: true
    ),
    cellClasses: [CustomTableViewCell.self],
    cellIdentifiers: [CustomTableViewCell.reuseIdentifier]
)

// In viewDidLoad()
override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerCells()
}
```

### 🔲 CollectionViewHelper

Create styled collection views with automatic cell registration:

```swift
let collectionView = CollectionViewHelper(
    style: CollectionViewStyle(
        backgroundColor: .clear,
        borderColor: .black,
        borderWidth: 1,
        cornerRadius: 4,
        clipsToBounds: true,
        isHidden: false,
        isUserInteractionEnabled: true
    ),
    collectionViewLayout: UICollectionViewFlowLayout(),
    cellClasses: [CustomCollectionViewCell.self],
    cellIdentifiers: [CustomCollectionViewCell.reuseIdentifier]
)

// In viewDidLoad()
override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.registerCells()
}
```

### 📅 PickerHelper

#### Date Picker

Display date picker with customizable options:

```swift
PickerHelper.selectDate(
    title: "Select Date",
    hideCancel: false,
    datePickerMode: .dateAndTime,
    selectedDate: Date(),
    minDate: nil,
    maxDate: Date().dateByAddingYears(5)
) { selectedDate in
    print("Selected date: \(selectedDate)")
    // Handle selected date
}
```

#### Option Picker

Display option picker for multiple choices:

```swift
let options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]

PickerHelper.selectOption(dataArray: options) { [weak self] value, index in
    print("Selected: \(value) at index: \(index)")
    // Handle selected option
}
```

## 🎨 Style System

TSwiftHelper uses a comprehensive style system that allows you to:

- **Consistent Styling**: Apply consistent visual styling across your app
- **Reusable Styles**: Create and reuse style configurations
- **Dynamic Theming**: Easily switch between different visual themes
- **Type Safety**: Compile-time checking for style properties

## 🔧 Advanced Features

### Image Helper Extension

The library includes a convenient `.uiImage` extension for cleaner image handling:

```swift
// Instead of UIImage(named: "image_name")
let image = "image_name".uiImage
```

### Automatic Cell Registration

For table views and collection views, TSwiftHelper automatically handles cell registration using the `reuseIdentifier` property.

## 📱 Example Project

Check out the example project in the repository to see TSwiftHelper in action with real-world usage scenarios.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🐛 Known Issues

- None currently reported

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/fanta1ty/TSwiftHelper/issues) page
2. Create a new issue with detailed information
3. Contact the maintainer

## 🏆 Acknowledgments

- The Swift community for inspiration and feedback
- Contributors who help improve the library
- iOS developers who use and test TSwiftHelper

## 📄 License

TSwiftHelper is available under the MIT license. See the [LICENSE](https://github.com/fanta1ty/TSwiftHelper/blob/master/LICENSE) file for more information.

## 👤 Author

**fanta1ty**
- GitHub: [@fanta1ty](https://github.com/fanta1ty)

---

**Made with ❤️ for the iOS development community**

If this library helps you in your projects, please consider giving it a ⭐️ on GitHub!
