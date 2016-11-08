//
//  Environment.swift
//  OstModernTest
//
//  Created by Shyam Bhudia on 04/11/2016.
//  Copyright © 2016 Shyam. All rights reserved.
//


class OstModernEnvironment {
	var feedPrefix: String {
		return "http://feature-code-test.skylark-cms.qa.aws.ostmodern.co.uk:8000"
	}
	
	var setURL: String {
		return "http://feature-code-test.skylark-cms.qa.aws.ostmodern.co.uk:8000/api/sets/"
	}
	
	
}
typealias Environment = OstModernEnvironment
