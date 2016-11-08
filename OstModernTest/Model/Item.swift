//
//  Item.swift
//  OstModernTest
//
//  Created by Shyam Bhudia on 07/11/2016.
//  Copyright © 2016 shyambhudia. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

enum ContentType: String {
	case divider = "divider"
	case episode = "episode"
}

class Item: Object, Mappable {
	dynamic var linkURL: String? = nil
	dynamic var subHeading: String? = nil
	dynamic var uid: String? = nil
	dynamic var linkTitle: String? = nil
	dynamic var selfString: String? = nil
	dynamic var contentURL: String? = nil
	dynamic var scheduleURL: String? = nil
	dynamic var setURL: String? = nil
	dynamic var contentTypeString: String? = nil
	dynamic var position = 0
	dynamic var heading: String? = nil
	dynamic var episode: Episode? = nil
	
	var contentType: ContentType? {
		if contentTypeString != nil {
			return ContentType(rawValue: contentTypeString!)
		}
		return nil
	}
	
	convenience required init(map: Map) {
		self.init()
	}
	//Using ObjectMapper
	func mapping(map: Map) {
		linkURL <- map["link_url"]
		subHeading <- map["sub_heading"]
		uid <- map["uid"]
		linkTitle <- map["link_title"]
		selfString <- map["self"]
		contentURL <- map["content_url"]
		scheduleURL <- map["schedule_url"]
		setURL <- map["set_url"]
		contentTypeString <- map["content_type"]
		position <- map["position"]
		heading <- map["heading"]
	}
}
