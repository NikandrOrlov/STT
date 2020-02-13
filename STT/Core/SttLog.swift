//
//  SttLog.swift
//  STT
//
//  Created by Peter Standret on 9/21/19.
//  Copyright © 2019 standret. All rights reserved.
//

import Foundation

public protocol SttLogType {
    
    var logInSystem: Bool { get }
    
    func trace(message: String, key: String)
    func warning(message: String, key: String)
    func error(message: String, key: String)
}

open class SttLog: SttLogType {
    
    public static func register(logger: SttLogType) {
        shared = logger
    }
    
    public static var shared: SttLogType = SttLog()
    
    private init() { }
    
    open var logInSystem = true
    
    open func trace(message: String, key: String) {
        log(type: "trace", message: message, key: key)
    }
    open func warning(message: String, key: String) {
        log(type: "warning", message: message, key: key)
    }
    open func error(message: String, key: String) {
        log(type: "error", message: message, key: key)
    }
    
    private func log(type: String, message: String, key: String) {
        
        if logInSystem {
            NSLog("<\(key)> \(message)")
        }
        else {
            print("[\(type)][\(SttLogDateConverter().convert(value: Date()))] <\(key)> \(message)")
        }
    }
    
    // MARK: - Obsoleted
    
    @available(swift, obsoleted: 5.0, message: "instead of static use shared property")
    public static var logInSystem = true
    
    open class func trace(message: String, key: String) {
        log(type: "trace", message: message, key: key)
    }
    open class func warning(message: String, key: String) {
        log(type: "warning", message: message, key: key)
    }
    open class func error(message: String, key: String) {
        log(type: "error", message: message, key: key)
    }
    
    fileprivate class func log(type: String, message: String, key: String) {
        fatalError()
    }
}

internal class SttLogDateConverter: ConverterType {
    
    func convert(value: Date, parameter: Any?) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss:SSSS"
        
        return formatter.string(from: value)
    }
}

internal class DateConverter: ConverterType {
    
    func convert(value: Date, parameter: Any?) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter.string(from: value)
    }
}
