//
//  WhyViewController.swift
//  OnionBrowser
//
//  Created by Benjamin Erhart on 03.05.23.
//  Copyright © 2023 Tigas Ventures, LLC (Mike Tigas). All rights reserved.
//

import UIKit
import OrbotKit

protocol WhyDelegate: AnyObject {

	var buttonTitle: String { get }

	func action()
}

class WhyViewController: UIViewController {

	static func instantiate(_ delegate: WhyDelegate) -> UINavigationController {
		let vc = Self()
		vc.delegate = delegate

		return UINavigationController(rootViewController: vc)
	}

	weak var delegate: WhyDelegate?

	@IBOutlet weak var titleLb: UILabel! {
		didSet {
			titleLb.text = String(
				format: NSLocalizedString(
					"Why %1$@ needs %2$@",
					comment: "Placeholder 1 is 'Onion Browser', placeholder 2 is 'Orbot'"),
				Bundle.main.displayName, OrbotKit.orbotName)
		}
	}

	@IBOutlet weak var body1Lb: UILabel! {
		didSet {
			body1Lb.text = String(
				format: NSLocalizedString(
					"So that you can do more with Tor on iOS! In %1$@, %2$@ improves the browsing experience with:",
					comment: "Placeholder 1 is 'Onion Browser', placeholder 2 is 'Orbot'"),
				Bundle.main.displayName, OrbotKit.orbotName)
		}
	}

	@IBOutlet weak var body2Lb: UILabel! {
		didSet {
			body2Lb.text = String(format: NSLocalizedString("%@ a little more speed", comment: "Placeholder is bullet point"), "•")
		}
	}

	@IBOutlet weak var body3Lb: UILabel! {
		didSet {
			body3Lb.text = String(format: NSLocalizedString("%@ new standards", comment: "Placeholder is bullet point"), "•")
		}
	}

	@IBOutlet weak var body4Lb: UILabel! {
		didSet {
			body4Lb.text = String(format: NSLocalizedString("%@ video and audio streaming", comment: "Placeholder is bullet point"), "•")
		}
	}

	@IBOutlet weak var body5Lb: UILabel! {
		didSet {
			body5Lb.text = String(format: NSLocalizedString("%@ more protection from IP leaks", comment: "Placeholder is bullet point"), "•")
		}
	}

	@IBOutlet weak var body6Lb: UILabel! {
		didSet {
			body6Lb.text = String(
				format: NSLocalizedString(
					"%@ alone provides a VPN proxy. It will hide apps from network monitoring and give you access when they are blocked.",
					comment: "Placeholder is 'Orbot'"),
				OrbotKit.orbotName)
		}
	}

	@IBOutlet weak var body7Lb: UILabel! {
		didSet {
			body7Lb.text = NSLocalizedString("Both are free to use. Free of tracking. Code is open source.", comment: "")
		}
	}

	@IBOutlet weak var button: UIButton! {
		didSet {
			button.setTitle(delegate?.buttonTitle)
		}
	}


	override func viewDidLoad() {
		super.viewDidLoad()

		navigationItem.title = NSLocalizedString("Why", comment: "")
		navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .close, target: self, action: #selector(close))
	}

	@IBAction
	func action() {
		dismiss(animated: true) {
			self.delegate?.action()
		}
	}

	@objc
	func close() {
		dismiss(animated: true)
	}
}
