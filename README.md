# MulticastDelegate
An elegant multicast delegate written in swift with Unit tests

Getting Started 
============

1. Copy MulticastDelegate.swift to your project
2. add to your class: `let multicastDelegate = MulticastDelegate<MyProtocol>()`
3. Other classes must add as a delegate: `service.delegate += self`
4. When you need to notify your delegates: `multicastDelegate.invokeDelegates { delegate in delegate?.done() }` alternatively `multicastDelegate |> { delegate in delegate?.done() }`

If you are using cocoaPods:

	pod 'MulticastDelegateSwift'
Add to your code:

	import MulticastDelegateSwift

Example
===========

    protocol TestDelegate {
	
	    func doThis()
    }

    class DelegateTestClass: TestDelegate {
	
	    func doThis() {
	    	// do nothing
    	}
    	func doThis(value:Int) {
	    	print(value)
	    }
    }

    class ServiceTestClass {
	
    	var delegate = MulticastDelegate<TestDelegate>()
	
	    func imReady() -> Bool {
		    // Call your delegates 
	    	delegate |> { delegate in
			
		    	delegate?.doThis()
			
	    	}

		    return true
    	}
    }



    let service = ServiceTestClass()
	let demoDelegateClass = DelegateTestClass()
		
	service.delegate += demoDelegateClass
		
	service.imReady()
    

Considerations
============
The code is based on NSHashTable with weak objects, so you don't need to worry when a delegate is deallocated

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
