//
//  DemoService.swift
//  MulticastDelegateDemo
//
//  Created by Joao Nunes on 30/12/15.
//  Copyright © 2015 Joao Nunes. All rights reserved.
//

import Foundation

protocol DemoServiceDelegate {
	
	func gotYourData(_ value:String)
}

class DemoService {
	
	static let defaultService = DemoService()
	
	var delegate = MulticastDelegate<DemoServiceDelegate>()

	func getData(_ value:String) {
		
		let delayTime = DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
		DispatchQueue.main.asyncAfter(deadline: delayTime) { [unowned self] () -> Void in
			
			self.delegate |> { delegate in
				
				delegate.gotYourData(value)
				
			}
			
		}
		
	}
	
}
