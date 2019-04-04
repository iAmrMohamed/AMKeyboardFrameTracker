# AMKeyboardFrameTracker
Simple iOS Keyboard frame tracker for custom interactive Keyboard dismissal

![AMKeyboardFrameTracker](https://user-images.githubusercontent.com/8356318/51436612-002c7b80-1c99-11e9-8d44-2143644ae617.gif)

## Features

- [x] Very simple and easy to use API
- [x] Provides both delegates and closure callbacks
- [x] Can be used with any type of input views (```UITextField```, ```UITextView```)
- [x] Allows for interactive Keyboard dismissal in a ```UITabBarController``` with ```inputAccessoryView```

## Example

To run the example project, clone the repo, and run the .xcworkspace.


### Installation
AMKeyboardFrameTracker is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AMKeyboardFrameTracker'
```

### Requirements
- Requires iOS 9.0+

### Usage

```swift
let height = 60 // this should be your input view height
let keyboardFrameTrackerView = AMKeyboardFrameTrackerView.init(height: height)
inputTextView.inputAccessoryView = keyboardFrameTrackerView
```

## Note
if your ```inputView``` height changes dynamically depending on the content inside it, then you will need keep the ```inputAccessoryView``` height in sync with your ```inputView``` height, to do that you need to override the ```viewDidLayoutSubviews``` in your ViewController and use the code below

```swift
override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.keyboardFrameTrackerView.setHeight(self.inputContainerView.frame.height)
}
```

or you can use layout constraints 
```swift
var keyboardFrameTrackerViewHeightConstraint: NSLayoutConstraint!
override func viewDidLoad() {
    super.viewDidLoad()
    self.keyboardFrameTrackerView.delegate = self
    self.inputTextView.inputAccessoryView = self.keyboardFrameTrackerView
    self.keyboardFrameTrackerView.translatesAutoresizingMaskIntoConstraints = false
    self.keyboardFrameTrackerViewHeightConstraint = self.keyboardFrameTrackerView.heightAnchor.constraint(equalTo: self.inputTextView.heightAnchor, multiplier: 0)
    self.keyboardFrameTrackerViewHeightConstraint.isActive = true
}
```

then you you can update the constant in ```viewDidLayoutSubviews```
```swift
override func viewDidLayoutSubviews() {
     super.viewDidLayoutSubviews()
     self.keyboardFrameTrackerViewHeightConstraint.constant = self.inputTextView.frame.height
}
```

### Closure Callbacks
```swift
keyboardFrameTrackerView.onKeyboardFrameDidChange = { [weak self] frame in
    guard let self = self else {return}
    print("Keyboard frame: ", frame)
}
```

### Delegate Callbacks

```swift
keyboardFrameTrackerView.delegate = self
```

```swift
extension ExampleViewController: AMKeyboardFrameTrackerDelegate {
    func keyboardFrameDidChange(with frame: CGRect) {
        print("Keyboard frame: ", frame)
    }
}
```

### UITabBarController Support
First you need to add your ```inputView``` to you ```ViewController```  ```view``` as a normal subview and then set all your constraints and layout, you will need to have a bottomConstraints from your ```inputView``` to ```ViewController```  ```view``` and use the code below

```swift
extension ExampleViewController: AMKeyboardFrameTrackerDelegate {
    func keyboardFrameDidChange(with frame: CGRect) {
        let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 0.0
        let bottomSapcing = self.view.frame.height - frame.origin.y - tabBarHeight - self.keyboardFrameTrackerView.frame.height

        self.inputViewBottomConstraint.constant = bottomSapcing > 0 ? bottomSapcing : 0
        self.view.layoutIfNeeded()
    }
}
```

## Author
[@iAmrMohamed](https://twitter.com/iAmrMohamed)

## License

AMKeyboardFrameTracker is available under the MIT license. See the LICENSE file for more info.
