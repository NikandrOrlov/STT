//
//  ValidatorFilter.swift
//  STT
//
//  Created by Peter Standret on 2/6/19.
//  Copyright © 2019 Peter Standret <pstandret@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation

public final class ValidatorBuilder<Target: ValidatorType> {
    
    private let name: String
    
    private var min = Int.min
    private var max = Int.max
    
    private var isUnique = false
    
    private var pattern: String? = nil
    
    private var customIncorrectError: String? = nil
    
    public init (name: String) {
        self.name = name
    }
    
    public func useMin(_ value: Int) -> ValidatorBuilder<Target> {
        min = value
        return self
    }
    public func useMax(_ value: Int) -> ValidatorBuilder<Target> {
        max = value
        return self
    }

    public func useUnique(_ value: Bool) -> ValidatorBuilder<Target> {
        isUnique = value
        return self
    }
    
    public func usePattern(_ value: String) -> ValidatorBuilder<Target> {
        pattern = value
        return self
    }

    public func useCustomError(_ value: String) -> ValidatorBuilder<Target> {
        customIncorrectError = value
        return self
    }
    
    public func build() -> ValidatorType {
        return Target(
            name: name,
            isRequired: isUnique,
            regexPattern: pattern,
            min: min,
            max: max,
            customIncorrectError: customIncorrectError
        )
    }

}
