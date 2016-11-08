//
//  HomeViewController.swift
//  OstModernTest
//
//  Created by Shyam Bhudia on 04/11/2016.
//  Copyright © 2016 shyambhudia. All rights reserved.
//

import UIKit
import RealmSwift
class HomeViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	var set:Set?
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
		//tableView setup
		tableView.delegate = self
		tableView.dataSource = self
		tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
		//Download in data
        ObjectParseManager.sharedManager.parseSetData(setUID: "coll_e8400ca3aebb4f70baf74a81aefd5a78") { (set) in
			//Update UI on the Main Thread
			DispatchQueue.main.async {
				if set == nil {
					//Show alert to inform user on the lack of data
					let alert = UIAlertController(title: "Download of Data Unsuccessful", message: "Sorry couldn't download new data old data may be present", preferredStyle: UIAlertControllerStyle.alert)
					alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (action) in
						alert.dismiss(animated: true, completion: nil)
					})
					
					self.present(alert, animated: true, completion: nil)
				}
				//Loading finished stop showing activity indicator
				self.activityIndicator.stopAnimating()
				//Load the set from Realm
				let realm = try! Realm()
				let set = realm.objects(Set.self)
				self.set = set.first
				self.navigationItem.title = set.first?.title
				//Load Set data in to tableView
				self.tableView.reloadData()
			}
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension HomeViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if set != nil {
			return set!.items.count
		}
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let item = set?.items[indexPath.row]
		//Show divider cell
		if item?.contentType == .divider {
			let cell = tableView.dequeueReusableCell(withIdentifier: "DividerCell", for: indexPath)
			cell.textLabel?.text = item?.heading
			cell.textLabel?.textColor = .red
			return cell
		}
		//Show episode cell
		let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath)
		cell.textLabel?.text = item?.episode?.title
		return cell
		
	}
}

extension HomeViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//Show selected item in the detail view
		let item = set?.items[indexPath.row]
		if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
			detailViewController.item = item
			self.navigationController?.pushViewController(detailViewController, animated: true)
		}
	}
}
