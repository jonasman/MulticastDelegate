//
//  DemoService.swift
//  MulticastDelegateDemo
//
//  Created by Joao Nunes on 30/12/15.
//  Copyright © 2015 Joao Nunes. All rights reserved.
//

import Foundation

protocol DemoServiceDelegate {
	
	func gotYourData(value:String)
}

class DemoService {
	
	static let defaultService = DemoService()
	
	var delegate = MulticastDelegate<DemoServiceDelegate>()

	func getData(value:String) {
		
		let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
		dispatch_after(delayTime, dispatch_get_main_queue()) { [unowned self] () -> Void in
			
			self.delegate |> { delegate in
				
				delegate?.gotYourData(value)
				
			}
			
		}
		
	}
	
}