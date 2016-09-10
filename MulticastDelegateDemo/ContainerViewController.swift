//
//  ContainerViewController.swift
//  MulticastDelegateDemo
//
//  Created by Joao Nunes on 30/12/15.
//  Copyright © 2015 Joao Nunes. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, DemoServiceDelegate {

	@IBOutlet weak var label: UILabel!
	
	let dataService = DemoService.defaultService
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		dataService.delegate += self
    }

	
	//MARK: DemoServiceDelegate
	func gotYourData(_ value:String) {
		label.text = value
	}
	
}
