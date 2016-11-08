//
//  Set.swift
//  OstModernTest
//
//  Created by Shyam Bhudia on 04/11/2016.
//  Copyright © 2016 Shyam. All rights reserved.
//

import ObjectMapper
import RealmSwift

class Set: Object, Mappable {
    dynamic var active = false
    dynamic var body: String? = nil
    dynamic var cachedFilmCount = 0
    dynamic var created: String? = nil
    dynamic var createdBy: String? = nil
    dynamic var endsOn: String? = nil
    dynamic var featured = false
    dynamic var filmCount = 0
    dynamic var formattedBody: String? = nil
    dynamic var hasPrice = false
    dynamic var hierarchyURL: String? = nil
	var items = List<Item>()
    dynamic var languageEndsOn: String? = nil
    dynamic var languageModified: String? = nil
    dynamic var languageModifiedBy: String? = nil
    dynamic var languagePublishOn: String? = nil
    dynamic var languageVersionNumber: String? = nil
    dynamic var languageVersionURL: String? = nil
    dynamic var lowestAmount: String? = nil
    dynamic var modified: String? = nil
    dynamic var modifiedBy: String? = nil
    dynamic var publishOn: String? = nil
    dynamic var quote: String? = nil
    dynamic var quoter: String? = nil
    dynamic var scheduleURL: String? = nil
	dynamic var scheduleURLs: String? = nil
    dynamic var selfString: String? = nil
    dynamic var setTypeSlug: String? = nil
    dynamic var setTypeURL: String? = nil
    dynamic var slug: String? = nil
    dynamic var summary: String? = nil
    dynamic var tempID = 0
    dynamic var tempImage: String? = nil
    dynamic var title: String? = nil
    dynamic var uid: String? = nil
    dynamic var versionNumber = 0
    dynamic var versionURL: String? = nil
    
	
    convenience required init(map: Map) {
        self.init()
    }
	
	//Using ObjectMapper
    func mapping(map: Map) {
        active <- map["active"]
        body <- map["body"]
		cachedFilmCount <- map["cached_film_count"]
		created <- map["created"]
		createdBy <- map["created_by"]
		endsOn <- map["ends_on"]
		featured <- map["featured"]
		filmCount <- map["film_count"]
		formattedBody <- map["formatted_body"]
		hasPrice <- map["has_price"]
		hierarchyURL <- map["hierarchy_url"]
		languageEndsOn <- map["language_ends_on"]
		languageModified <- map["language_modified"]
		languageModifiedBy <- map["language_modified_by"]
		languagePublishOn <- map["language_publish_on"]
		languageVersionNumber <- map["language_version_number"]
		languageVersionURL <- map["language_version_url"]
		lowestAmount <- map["lowest_amount"]
		modified <- map["modified"]
		modifiedBy <- map["modified_by"]
		publishOn <- map["publish_on"]
		quote <- map["quote"]
		quoter <- map["quoter"]
		scheduleURL <- map["schedule_url"]
		selfString <- map["self"]
		setTypeSlug <- map["set_type_slug"]
		setTypeURL <- map["set_type_url"]
		slug <- map["slug"]
		summary <- map["summary"]
		tempID <- map["temp_id"]
		tempImage <- map["temp_image"]
		title <- map["title"]
		uid <- map["uid"]
		versionNumber <- map["version_number"]
		versionURL <- map["version_url"]
		let scheduleURLS = map["schedule_urls"]
		let convertedScheduleString = (scheduleURLS.currentValue as? [String])?.joined(separator: ",")
		scheduleURL = convertedScheduleString
		
		
    }
}

