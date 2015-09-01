//
//  Network.swift
//  SwinjectMVVMExample
//
//  Created by Yoichi Tagaya on 8/30/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import ReactiveCocoa
import Alamofire

public final class Network: Networking {
    private let queue = dispatch_queue_create(
        "SwinjectMMVMExample.ExampleModel.Network.Queue",
        DISPATCH_QUEUE_SERIAL)
    
    public init() { }
    
    public func requestJSON(url: String, parameters: [String : AnyObject]?)
        -> SignalProducer<AnyObject, NetworkError>
    {
        return SignalProducer { observer, disposable in
            let serializer = Alamofire.Request.JSONResponseSerializer()
            Alamofire.request(.GET, url, parameters: parameters)
                .response(queue: self.queue, responseSerializer: serializer) {
                    _, _, result in
                    switch result {
                    case .Success(let value):
                        sendNext(observer, value)
                        sendCompleted(observer)
                    case .Failure(_, let error):
                        sendError(observer, NetworkError(error: error))
                    }
            }
        }
    }
}
