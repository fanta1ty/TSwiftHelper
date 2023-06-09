# TSwiftHelper
TSwiftHelper is a library for iOS written in Swift to help user lots of helpful extension functions in development

[![Platform](https://img.shields.io/cocoapods/p/TSwiftHelper)](https://cocoapods.org/pods/TSwiftHelper)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-brightgreen)](https://developer.apple.com/swift/)
[![Version](https://img.shields.io/badge/pod-1.1.6-informational)](https://cocoapods.org/?q=TSwiftHelper)
[![License](http://img.shields.io/badge/license-MIT-blue)](https://github.com/fanta1ty/TSwiftHelper/blob/master/LICENSE)
[![Email](https://img.shields.io/badge/contact-@thinhnguyen12389@gmail.com-blue)](thinhnguyen12389@gmail.com)

## Requirements
- iOS 11.0+
- Swift 5

### Installation

### From [CocoaPods](http://cocoapods.org)

TSwiftHelper is available through CocoaPods. To install it, simply add the following line to your Podfile:
```ruby
pod 'TSwiftHelper'
```
Second, install `TProgressHUD` into your project:
```ruby
pod install
```

### Manual Installation

Just drag and drop the files in `TSwiftHelper/TSwiftHelper` folder into your project

### Swift Package
`TProgressHUD` is designed for Swift 5. To depend on the logging API package, you need to declare your dependency in your `Package.swift`

```swift
.package(url: "https://github.com/fanta1ty/TSwiftHelper.git", brand: "master"),
```

## Usage
### LabelHelper
```swift
let testLb = LabelHelper(style: LabelStyle(backgroundColor: .Clear, 
                                           borderColor: .Clear, 
                                           borderWidth: 0, 
                                           corderRadius: 0, 
                                           textColor: .Black, 
                                           textFont: .regular(size: 16), 
                                           textAlignment: .center, 
                                           numberOfLines: 1, 
                                           isHidden: false), 
                                text: "Your text")
```

### ButtonHelper
```swift
let testBtn = ButtonHelper(style: ButtonStyle(backgroundColor: .Blue, 
                                              borderColor: .Black, 
                                              borderWidth: 1, 
                                              corderRadius: 8, 
                                              textColor: .White, 
                                              textFont: .regular(size: 16), 
                                              clipsToBounds: true, 
                                              isHidden: false, 
                                              isUserInteractionEnabled: true), 
                                  title: "Button Title", 
                                  normalImage: "Button Image".uiImage, 
                                  selectedImage: "Button Image when selected".uiImage) 
                                  
// uiImage() is a function to set image for components instead of using UIimage(named: "Image Name")
```

### TextFieldHelper
```swift
let testTextfield = TextFieldHelper(style: TextFieldStyle(backgroundColor: .Clear, 
                                                          borderColor: .Black, 
                                                          borderWidth: 1, 
                                                          corderRadius: 8, 
                                                          textColor: .Black, 
                                                          textFont: .regular(size: 16), 
                                                          textAlignment: .left, 
                                                          keyboardType: .default, 
                                                          isSecureTextEntry: false, 
                                                          autocorrectionType: .default, 
                                                          spellCheckingType: .no, 
                                                          autocapitalizationType: .none, 
                                                          clearButtonMode: .never, 
                                                          isHidden: false, 
                                                          isUserInteractionEnabled: true), 
                                            text: "Text", 
                                            placeholder: "Placeholder text")
```

### ViewHelper
```swift
let testView = ViewHelper(style: ViewStyle(backgroundColor: .Clear, 
                                           borderColor: .Clear, 
                                           borderWidth: 0, 
                                           corderRadius: 0, 
                                           clipsToBounds: true, 
                                           isHidden: false, 
                                           isUserInteractionEnabled: true))
```

### ImageViewHelper
```swift
let testImageView = ImageViewHelper(style: ImageViewStyle(backgroundColor: .Clear, 
                                                          borderColor: .Black, 
                                                          borderWidth: 1, 
                                                          corderRadius: 10, 
                                                          contentMode: .scaleAspectFill, 
                                                          clipsToBounds: true, 
                                                          isHidden: false), 
                                            iconImage: "Your View Image".uiImage)
// uiImage() is a function to set image for components instead of using UIimage(named: "Image Name")    
```

### TableViewHelper
```swift
let tableView = TableViewHelper(style: TableViewStyle(backgroundColor: .Clear, 
                                                      borderColor: .Clear, 
                                                      borderWidth: 0, 
                                                      corderRadius: 0, 
                                                      clipsToBounds: true, 
                                                      isHidden: false, 
                                                      isUserInteractionEnabled: true), 
                                       cellClasses: [YourCell.self], 
                                       cellIdentifiers: [YourCell.reuseIdentifier])
                                       
//Using reuseIdentifier, will automically create an identifier for your cell
//Can use more than one cell, depence on what you want to display on tableview: cellClasses: [FirstCell.self,SecondCell.self], also add this code to viewDidLoad()

override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCells()
}
```

### CollectionViewHelper
```swift
let collectionView = CollectionViewHelper(style: CollectionViewStyle(backgroundColor: .Clear, 
                                                                     borderColor: .Black, 
                                                                     borderWidth: 1, 
                                                                     corderRadius: 4, 
                                                                     clipsToBounds: true, 
                                                                     isHidden: false, 
                                                                     isUserInteractionEnabled: true), 
                                                 collectionViewLayout: UICollectionViewLayout(), 
                                                 cellClasses: [YourCell.self], 
                                                 cellIdentifiers: [YourCell.reuseIdentifier])
                                                 
//Using reuseIdentifier, will automically create an identifier for your cell
//Can use more than one cell, depence on what you want to display on collectionView: cellClasses: [FirstCell.self,SecondCell.self], also add this code to viewDidLoad()

override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerCells()
}                                                 
```

### PickerHelper
```swift
// DatePicker
PickerHelper.selectDate(title: "Your Picker Title", 
                        hideCancel: false, 
                        datePickerMode: .dateAndTime, 
                        selectedDate: Date(), 
                        minDate: nil, 
                        maxDate: Date().dateByAddingYears(5), 
                        didSelectDate: { selectedDay in
            
                                            //Your Logic code with Picker 
                                        })

// Option Picker
let data = ["Option1", "Option2", "Option3", "Option4", "Option5", "Option6"]

PickerHelper.selectOption(dataArray: data) { [weak self] value, index in   //value: data value, index: data order
     //Your Logic code with Picker
}
```
## License

TSwiftHelper is available under the MIT license. See the [LICENSE](https://github.com/fanta1ty/TSwiftHelper/blob/master/LICENSE) file for more info. 

## Author

[@thinhnguyen](https://github.com/fanta1ty)
