//
//  MulticastDelegate.swift
//  MulticastDelegateDemo
//
//  Created by Joao Nunes on 28/12/15.
//  Copyright © 2015 Joao Nunes. All rights reserved.
//

import Foundation

/**
 *  `MulticastDelegate` lets you easily create a "multicast delegate" for a given protocol or class.
 */
public class MulticastDelegate<T> {
	
	private var delegates = NSHashTable.weakObjectsHashTable()
	
	public init() {}
	
    /**
     *  Use this method to add a delelgate.
     *
     *  Alternatively, you can use the `+=` operator to add a delegate.
     *
     *  - parameter delegate:  The delegate to be added.
     */
	public func addDelegate(delegate: T) {
		guard delegate is AnyObject else { return }
		delegates.addObject((delegate as! AnyObject))
	}
    
    /**
     *  Use this method to remove a previously-added delegate.
     *
     *  Alternatively, you can use the `-=` operator to add a delegate.
     *
     *  - parameter delegate:  The delegate to be removed.
     */
	public func removeDelegate(delegate: T) {
		guard delegate is AnyObject else { return }
		delegates.removeObject((delegate as! AnyObject))
	}
	
    /**
     *  Use this method to invoke a closure on each delegate.
     *
     *  Alternatively, you can use the `|>` operator to invoke a given closure on each delegate.
     *
     *  - parameter invocation: The closure to be invoked on each delegate.
     */
	public func invokeDelegates(invocation: (T) -> ()) {
		
		for delegate in delegates.allObjects {
			invocation(delegate as! T)
		}
	}
}

/**
 *  Use this operator to add a delegate.
 *
 *  This is a convenience operator for calling `addDelegate`.
 *
 *  - parameter left:   The multicast delegate
 *  - parameter right:  The delegate to be added
 */
public func +=<T>(left: MulticastDelegate<T>, right: T) -> MulticastDelegate<T> {
	
	left.addDelegate(right)
	return left
}

/**
 *  Use this operator to remove a delegate.
 *
 *  This is a convenience operator for calling `removeDelegate`.
 *
 *  - parameter left:   The multicast delegate
 *  - parameter right:  The delegate to be removed
 */
public func -=<T>(left: MulticastDelegate<T>, right: T) -> MulticastDelegate<T> {
	
	left.removeDelegate(right)
	return left
}

/**
 *  Use this operator invoke a closure on each delegate.
 *
 *  This is a convenience operator for calling `invokeDelegates`.
 *
 *  - parameter left:   The multicast delegate
 *  - parameter right:  The closure to be invoked on each delegate
 */
infix operator |> { associativity left precedence 130 }
public func |><T>(left: MulticastDelegate<T>, right: (T) -> ()) -> MulticastDelegate<T> {
	
	left.invokeDelegates(right)
	return left
}