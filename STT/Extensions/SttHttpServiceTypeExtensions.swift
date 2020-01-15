//
//  SttHttpServiceTypeExtensions.swift
//  STT
//
//  Created by Piter Standret on 6/22/18.
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
import Alamofire
import RxSwift

public extension SttHttpServiceType {
    
    func get(controller: ApiControllerType,
             data: [String: Any] = [:],
             headers: [String: String] = [:],
             insertToken: Bool = false) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.get(controller: controller,
                        data: data,
                        headers: headers,
                        insertToken: insertToken)
    }
    
    func get(controller: ApiControllerType,
             object: Encodable?,
             headers: [String: String] = [:],
             insertToken: Bool = false) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.get(controller: controller,
                        data: object?.getDictionary() ?? [:],
                        headers: headers,
                        insertToken: insertToken)
    }
    
    func post(controller: ApiControllerType,
              data: [String: Any] = [:],
              headers: [String: String] = [:],
              insertToken: Bool = false,
              encoding: ParameterEncoding = JSONEncoding.default) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.post(controller: controller,
                         data: data,
                         headers: headers,
                         insertToken: insertToken,
                         encoding: encoding)
    }
    
    func post(controller: ApiControllerType,
              object: Encodable?,
              headers: [String:String] = [:],
              insertToken: Bool = false,
              encoding: ParameterEncoding = JSONEncoding.default) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.post(controller: controller,
                         data: object?.getDictionary() ?? [:],
                         headers: headers,
                         insertToken: insertToken,
                         encoding: encoding)
    }
    
    func delete(controller: ApiControllerType,
                data: [String: Any] = [:],
                headers: [String:String] = [:],
                insertToken: Bool = false,
                encoding: ParameterEncoding = URLEncoding.default) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.delete(controller: controller,
                           data: data,
                           headers: headers,
                           insertToken: insertToken,
                           encoding: encoding)
    }
    
    func delete(controller: ApiControllerType,
                object: Encodable?,
                headers: [String:String] = [:],
                insertToken: Bool = false,
                encoding: ParameterEncoding = URLEncoding.default) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.delete(controller: controller,
                           data: object?.getDictionary() ?? [:],
                           headers: headers,
                           insertToken: insertToken,
                           encoding: encoding)
    }
    
    func put(controller: ApiControllerType,
             data: [String: Any] = [:],
             headers: [String:String] = [:],
             insertToken: Bool = false,
             isFormUrlEncoding: Bool = false) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.put(controller: controller,
                        data: data,
                        headers: headers,
                        insertToken: insertToken,
                        isFormUrlEncoding: isFormUrlEncoding)
    }
    
    func put(controller: ApiControllerType,
             object: Encodable?,
             headers: [String:String] = [:],
             insertToken: Bool = false,
             isFormUrlEncoding: Bool = false) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.put(controller: controller,
                        data: object?.getDictionary() ?? [:],
                        headers: headers,
                        insertToken: insertToken,
                        isFormUrlEncoding: isFormUrlEncoding)
    }
    
    func patch(controller: ApiControllerType,
               data: [String: Any] = [:],
               headers: [String:String] = [:],
               insertToken: Bool = false,
               isFormUrlEncoding: Bool = false) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.patch(controller: controller,
                          data: data,
                          headers: headers,
                          insertToken: insertToken,
                          isFormUrlEncoding: isFormUrlEncoding)
    }
    
    func patch(controller: ApiControllerType,
               object: Encodable?,
               headers: [String:String] = [:],
               insertToken: Bool = false,
               isFormUrlEncoding: Bool = false) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.patch(controller: controller,
                          data: object?.getDictionary() ?? [:],
                          headers: headers,
                          insertToken: insertToken,
                          isFormUrlEncoding: isFormUrlEncoding)
    }
    
    func upload(controller: ApiControllerType,
                object: UploadedObject? = nil,
                parameters: [String: String] = [:],
                headers: [String: String] = [:],
                insertToken: Bool = false,
                method: HTTPMethod = .post,
                progresHandler: ((Float) -> Void)? = nil,
                sessionManagaer: SessionManager? = nil) -> Observable<(HTTPURLResponse, Data)> {
        
        return self.upload(
            controller: controller,
            object: object,
            parameters: parameters,
            headers: headers,
            insertToken: insertToken,
            method: method,
            progresHandler: progresHandler,
            sessionManager: sessionManagaer
        )
    }
}
