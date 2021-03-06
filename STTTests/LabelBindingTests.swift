//
//  LabelBindingTests.swift
//  STTTests
//
//  Created by Peter Standret on 7/5/19.
//  Copyright © 2019 standret. All rights reserved.
//

import XCTest
@testable import STT

class LabelBindingTests: XCTestCase {
    
    var value: UILabel!
    var valueOptional: UILabel!
    var valueOptionalNil: UILabel!
    var valueOptionalWithFallback: UILabel!
    
    var tf = UITextField()
    
    var set: SttBindingSet<LabelBindingTests>!
    
    override func setUp() {
        
        value = UILabel()
        valueOptional = UILabel()
        valueOptionalNil = UILabel()
        valueOptionalWithFallback = UILabel()
        
        set = SttBindingSet(parent: self)
    }
    
    
    func testString() {
        
        let stringDynamic = Dynamic("string")
        let optSringDynamic = Dynamic<String?>("with value")
        let optSringDynamicNil = Dynamic<String?>(nil)
        
        set.bind(value).to(stringDynamic)
        set.bind(valueOptional).to(optSringDynamic)
        set.bind(valueOptionalNil).to(optSringDynamicNil)
        set.bind(valueOptionalWithFallback).to(optSringDynamicNil).fallBack(value: "some value")
        set.bind(tf).to(stringDynamic)
        
        set.apply()
        
        XCTAssertEqual(value.text, stringDynamic.value)
        XCTAssertEqual(valueOptional.text, optSringDynamic.value)
        XCTAssertEqual(valueOptionalNil.text, "")
        XCTAssertEqual(valueOptionalWithFallback.text, "some value")
    }
    
    func testInt() {
        
        let intDynamic = Dynamic(1)
        let optIntDynamic = Dynamic<Int?>(1)
        let optIntDynamicNil = Dynamic<Int?>(nil)
        
        set.bindInt(value).to(intDynamic)
        set.bindInt(valueOptional).to(optIntDynamic)
        set.bindInt(valueOptionalNil).to(optIntDynamicNil)
        set.bindInt(valueOptionalWithFallback).to(optIntDynamicNil).fallBack(value: 2319)

        set.apply()
        
        XCTAssertEqual(value.text, String(intDynamic.value))
        XCTAssertEqual(valueOptional.text, String(optIntDynamic.value!))
        XCTAssertEqual(valueOptionalNil.text, "")
        XCTAssertEqual(valueOptionalWithFallback.text, "2319")
    }
    
    func testFallbackInt() {
        
        let dynamic = Dynamic<Int?>(1)
        
        set.bind(Int.self).forProperty({ $0.value.text = "\($1)" })
            .to(dynamic)
            .fallBack(value: 2319)
        
        set.apply()
        
        XCTAssertEqual(value.text, "1")
        
        dynamic.value = nil
        
        XCTAssertEqual(value.text, "2319")
    }
}
