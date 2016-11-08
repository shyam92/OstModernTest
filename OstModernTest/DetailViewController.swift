//
//  DetailViewController.swift
//  OstModernTest
//
//  Created by Shyam Bhudia on 08/11/2016.
//  Copyright © 2016 shyambhudia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var summaryLabel: UILabel!

	var item: Item?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		titleLabel.text = item?.episode?.title
		summaryLabel.text = item?.episode?.synopsis
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
    }
    


}
