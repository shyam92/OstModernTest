//
//  ObjectParseManager.swift
//  OstModernTest
//
//  Created by Shyam Bhudia on 04/11/2016.
//  Copyright © 2016 Shyam. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift
import ObjectMapper
import Alamofire

class ObjectParseManager: NSObject {
    static let sharedManager = ObjectParseManager()
	static let downloadQueue = DispatchQueue.global(qos: .utility)
    //Data Parser to convert NSData to JSON to Set Model format
	
	func parseSetData(setUID: String, onCompletion: @escaping (Set?)-> Void) {
		
		Alamofire.request(Const.environment.setURL + setUID + "/").validate().responseJSON(queue: ObjectParseManager.downloadQueue, options: []) { response in
			//If it is bad request or no request show Error message/old data message
			if response.response?.statusCode == nil || (response.response?.statusCode)! >= 400{
				onCompletion(nil)
				return
			}
			//Download response data
			if let data = response.data {
				//Convert it to JSON using SwiftyJSON
				let json = JSON(data: response.data!)
				//Map it to Set Model using ObjectMapper
				if let set = Set(JSONString: json.rawString()!) {
					//Map items array seperately
					let itemsJSON = json["items"].rawString()!
					let itemsArray = Mapper<Item>().mapArray(JSONString: itemsJSON)
					//Download items information
					var count = 0
					for item in itemsArray! {
						//Download items information in a serial queue
						Alamofire.request(Const.environment.feedPrefix + item.contentURL!).responseJSON(queue: ObjectParseManager.downloadQueue, options: []) { response in
							if let data = response.data {
								//Add it to item
								let json = JSON(data: data as Data)
								if let episode = Episode(JSONString: json.rawString()!) {
									item.episode = episode
									//add item to set
									set.items.append(item)
								}
							}
							count = count + 1
							//Correct amount of data is properly downloaded
							if count == itemsArray!.count {
								//Write to Realm
								let realm = try! Realm()
								realm.beginWrite()
								//Delete Old Data and Replace with New
								realm.deleteAll()
								realm.add(set)
								try! realm.commitWrite()
								//Return to completion block
								onCompletion(set)
							}
						}
					}
				}
			}
		}
	}
}
