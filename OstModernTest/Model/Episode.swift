//
//  Episode.swift
//  OstModernTest
//
//  Created by Shyam Bhudia on 07/11/2016.
//  Copyright © 2016 shyambhudia. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

class Episode: Object, Mappable {
	dynamic var subtitle: String? = nil
	dynamic var uid: String? = nil
	dynamic var scheduleURLs: String? = nil
	dynamic var imageURLs: String? = nil
	dynamic var publishOn: String? = nil
	dynamic var talentURLs: String? = nil
	dynamic var scheduleURL: String? = nil
	dynamic var planURLs: String? = nil
	dynamic var languagePublishOn: String? = nil
	dynamic var episodeNumber: String? = nil
	dynamic var languageEndsOn: String? = nil
	dynamic var languageModified: String? = nil
	dynamic var languageModifiedBy: String? = nil
	dynamic var languageVersionNumber: String? = nil
	dynamic var languageVersionURL: String? = nil
	dynamic var endsOn: String? = nil
	dynamic var slug: String? = nil
	dynamic var versionNumber = 0
	dynamic var versionURL: String? = nil
	dynamic var modified: String? = nil
	dynamic var modifiedBy: String? = nil
	dynamic var title: String? = nil
	dynamic var items: String? = nil
	dynamic var selfString: String? = nil
	dynamic var created: String? = nil
	dynamic var createdBy: String? = nil
	dynamic var tagURLs: String? = nil
	dynamic var synopsis: String? = nil
	dynamic var parentURL: String? = nil
	
	
	convenience required init(map: Map) {
		self.init()
	}
	//Using ObjectMapper
	func mapping(map: Map) {
		created <- map["created"]
		createdBy <- map["created_by"]
		endsOn <- map["ends_on"]
		languageEndsOn <- map["language_ends_on"]
		languageModified <- map["language_modified"]
		languageModifiedBy <- map["language_modified_by"]
		languagePublishOn <- map["language_publish_on"]
		languageVersionNumber <- map["language_version_number"]
		languageVersionURL <- map["language_version_url"]
		modified <- map["modified"]
		modifiedBy <- map["modified_by"]
		publishOn <- map["publish_on"]
		selfString <- map["self"]
		slug <- map["slug"]
		title <- map["title"]
		uid <- map["uid"]
		versionNumber <- map["version_number"]
		versionURL <- map["version_url"]
		let scheduleURLS = map["schedule_urls"]
		let convertedScheduleString = (scheduleURLS.currentValue as? [String])?.joined(separator: ",")
		scheduleURL = convertedScheduleString
		
		subtitle <- map["subtitle"]
		imageURLs = (map["image_urls"].currentValue as? [String])?.joined(separator: ",")
		talentURLs = (map["talent_urls"].currentValue as? [String])?.joined(separator: ",")
		planURLs = (map["plan_urls"].currentValue as? [String])?.joined(separator: ",")
		episodeNumber <- map["episode_number"]
		items = (map["items"].currentValue as? [String])?.joined(separator: ",")
		tagURLs = (map["tag_urls"].currentValue as? [String])?.joined(separator: ",")
		synopsis <- map["synopsis"]
		parentURL <- map["parent_url"]
	}
}
