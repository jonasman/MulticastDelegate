[![Build Status](https://travis-ci.org/jonasman/MulticastDelegate.svg?branch=master)](https://travis-ci.org/jonasman/MulticastDelegate)
[![MulticastDelegateSwift](https://img.shields.io/cocoapods/v/MulticastDelegateSwift.svg)]()
# MulticastDelegate
An elegant multicast delegate written in swift with Unit tests

Installation
============

#### Manual

Copy `MulticastDelegate.swift` to your project

#### CocoaPods
```ruby
	pod 'MulticastDelegateSwift'
```
#### Swift Package Manager
You can use [Swift Package Manager](https://swift.org/package-manager/) and specify a dependency in `Package.swift` by adding this:
```swift
.Package(url: "https://github.com/jonasman/MulticastDelegate.git", majorVersion: 2)
```

Usage
============
Import the module
```swift
	import MulticastDelegateSwift
```

1. Add to your class: `let multicastDelegate = MulticastDelegate<MyProtocol>()`
2. Other classes must add as a delegate: `service.delegate.addDelegate(self)`
3. When you need to notify your delegates: `multicastDelegate.invokeDelegates { delegate in delegate.done() }`

Alternative version:

1. Add to your class: `let multicastDelegate = MulticastDelegate<MyProtocol>()`
2. Other classes must add as a delegate: `service.delegate += self`
3. When you need to notify your delegates: `multicastDelegate |> { $0.done() }`


Example
===========
```swift
protocol ServiceDelegate {
	func serviceGotData()
}

class Service {
	
	var delegate = MulticastDelegate<ServiceDelegate>()
	
	func fetchData() -> Bool {
		// fetch Data and notify your delegates
		// Call your delegates 
		delegate |> { delegate in
			delegate.serviceGotData()
		}
		return true
	}
}
```    
```swift
class MainViewController: UIViewController, TestDelegate {
	
	func serviceGotData() {
	    	// do nothing
	}
}
```
```swift
let service = Service()
let viewController = MainViewController()
		
service.delegate += viewController
		
service.fetchData()
```    

Operators
============
There are 3 operators to simplify the multicast usage

`+=` calls addDelegate(delegate: T)

`-=` calls removeDelegate(delegate: T)

`|>` calls invokeDelegates(invocation: (T) -> ())


Considerations
============
The code is based on HashTable with weak objects, so you don't need to worry when a delegate is deallocated

Licence
============
        
The MIT License (MIT)

Copyright (c) 2014 João Nunes

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
