//
//  YOOX_NET_PORTERTests.swift
//  YOOX_NET_PORTERTests
//
//  Created by Intelivex Labs on 19/06/18.
//  Copyright © 2018 Intelivex Labs. All rights reserved.
//

import XCTest
@testable import YOOX_NET_PORTER

class YOOX_NET_PORTERTests: XCTestCase {
    var productDataModel:ProductManager?
    override func setUp() {
        super.setUp()
        productDataModel = ProductManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCorrectResponse() {
        let mockResponse = ["summaries":[["S":"test error"]],"abcd":""] as [String : Any]
        guard let respone = productDataModel?.validResponse(json: mockResponse) else {
            XCTFail("Missing required data key : summaries")
            return
        }
        XCTAssert((respone.0?.count)! > 0 ,"Not a correct reponse")
    }
    
    func testErrorResponse() {
        let mockResponse = ["error":"data is not available"] as [String : Any]
        guard let respone = productDataModel?.validResponse(json: mockResponse) else {
            XCTFail("Missing required data key : error")
            return
        }
        XCTAssert(respone.1 != nil ,"Not a correct error response")
    }
    
    func testProductList() {
        let mockResponse = ["summaries":[
            ["id":1054052,"name":"Reversible checked wool-blend cape","price":["currency":"GBP","divisor":100,"amount":13900]],
            ["id":1054052,"name":"Reversible checked wool-blend cape","price":["currency":"GBP","divisor":100,"amount":13900]]]
            ] as [String : Any]
        guard let respone = productDataModel?.GetProductList(data:mockResponse) else {
            XCTFail("Missing Required key")
            return
        }
        XCTAssert(respone.count > 0 ,"Not able to get product list")
    }
    
    func testPriceModel() {
        let mockPriceDic = ["currency":"GBP","divisor":100,"amount":30] as [String : Any]
        
        guard let result = productDataModel?.ToPrice(data: mockPriceDic) else {
            XCTFail("Price conversion failed")
            return
        }
        XCTAssert(result.amount >= 0 , "Amount is not correct")
    }
    
    func testDictionaryToProductModel() {
        let mockDictionary = ["id":1054052,"name":"Reversible checked wool-blend cape",
                              "price":["currency":"GBP","divisor":100,"amount":13900]] as [String : Any]
        let result = productDataModel?.ToProduct(data: mockDictionary)
        XCTAssert(result != nil,"Product conversion failed")
    }
    
}

/*
 class YOOX_NET_PORTERTests: XCTestCase {
 var productDataModel:ProductManager?
 
 var response: [[String : String]]?
 var error: String?
 
 
 override func setUp() {
 super.setUp()
 let mockResponse = ["error":"cehck cnow"] as [String : Any]
 productDataModel = ProductManager()
 (response,error) = productDataModel?.validResponse(json: mockResponse) as! ([[String : String]]?, String?)
 }
 
 override func tearDown() {
 // Put teardown code here. This method is called after the invocation of each test method in the class.
 super.tearDown()
 }
 
 func testCorrectResponse() {
 //        guard let respone = productDataModel?.validResponse(json: mockResponse) else {
 //            XCTFail("Missing required data key : summaries")
 //            return
 //        }
 if let error = error {
 //            XCTAssertTrue(error, "Not able to get Error")
 
 } else {
 XCTAssertTrue((response?.count)! > 0, "Got the summaries data")
 }
 }
 
 func testPriceModel() {
 let mockPriceDic = ["currency":"GBP","divisor":100,"amount":13900] as [String : Any]
 let result = productDataModel?.ToPrice(data: mockPriceDic)
 XCTAssert(result != nil, "Price conversion failed")
 }
 
 func testDataToModel() {
 let mockDictionary = ["id":1054052,"name":"Reversible checked wool-blend cape","price":["currency":"GBP","divisor":100,"amount":13900]] as [String : Any]
 let result = productDataModel?.ToProduct(data: mockDictionary)
 XCTAssertTrue(result != nil)
 }
 
 }
 */
