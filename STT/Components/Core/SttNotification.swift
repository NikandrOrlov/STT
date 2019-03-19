//
//  SttNotification.swift
//  STT
//
//  Created by Peter Standret on 2/28/19.
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
import RxSwift

public class SttNotificationErrorService: SttNotificationErrorServiceType {
    
    let subject = PublishSubject<SttBaseError>()
    
    public var errorObservable: Observable<SttBaseError> { return subject }
    
    public init() {}
    
    public func useError<T>(observable: Observable<T>, ignoreBadRequest: Bool, customMessage: String?) -> Observable<T> {
        return observable.do(onError: { (error) in
            if let er = error as? SttBaseError {
                var flag = true
                
                if ignoreBadRequest {
                    switch er {
                    case .apiError(let api):
                        switch api {
                        case .badRequest( _):
                            flag = false
                        case .otherApiError(let code):
                            flag = code != 401
                        default: break
                        }
                    default: break
                    }
                }
                if flag {
                    self.subject.onNext(er)
                }
                else if let messageError = customMessage {
                    self.subject.onNext(SttBaseError.unkown(messageError))
                }
            }
            else {
                self.subject.onNext(SttBaseError.unkown("\(error)"))
            }
        })
    }
}
