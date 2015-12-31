//
//  MulticastDelegate.swift
//  MulticastDelegateDemo
//
//  Created by Joao Nunes on 28/12/15.
//  Copyright © 2015 Joao Nunes. All rights reserved.
//

import Foundation


public class MulticastDelegate<T> {
	
	private var delegates = NSHashTable.weakObjectsHashTable()
	
	public func addDelegate(delegate: T) {
		guard delegate is AnyObject else { return }
		delegates.addObject((delegate as! AnyObject))
	}
	public func removeDelegate(delegate: T) {
		guard delegate is AnyObject else { return }
		delegates.removeObject((delegate as! AnyObject))
	}
	
	public func invokeDelegates(invocation: (T) -> ()) {
		
		for delegate in delegates.allObjects {
			invocation(delegate as! T)
		}
	}
}

public func +=<T>(left: MulticastDelegate<T>, right: T) -> MulticastDelegate<T> {
	
	left.addDelegate(right)
	return left
}

public func -=<T>(left: MulticastDelegate<T>, right: T) -> MulticastDelegate<T> {
	
	left.removeDelegate(right)
	return left
}

infix operator |> { associativity left precedence 130 }
public func |><T>(left: MulticastDelegate<T>, right: (T) -> ()) -> MulticastDelegate<T> {
	
	left.invokeDelegates(right)
	return left
}