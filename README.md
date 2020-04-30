# ObservableUserDefaults

 This package contains `UserDefaults`  property wrapper. The property wrapper has statically typed keyes and provides a conveniece to observe `UserDefaults` changes.
 
 ## Development

 To  install this package just add the follwing in yor package 

``` swift 
 .package(url: "https://github.ibmgcloud.net/ePA/ios-observable-user-defaults", from: "1.0.0"),
```

# Usage 

Implementation 
```swift
// Declare a new key
extension Key {
    static let sdkPort: Key = "v"
}

// Create my class
class MyClass {
    // Use the property wrapper to add new value to `UserDefaults`
    @UserDefault(key: .sdkPort, defaultValue: 8080)
    var sdkPort: Int
}

// Initialize my class
var myClass = MyClass()

// Observe changes
var observation = myClass.$sdkPort.observe { old, new in
    print("Changed from: \(old) to \(new)")
}

// Make some changes
myClass.sdkPort = 443
````

Output 
`Changed from: 8080 to 443`
