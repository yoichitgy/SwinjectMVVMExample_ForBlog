//
//  NetworkSpec.swift
//  SwinjectMVVMExample
//
//  Created by Yoichi Tagaya on 8/30/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import Quick
import Nimble
@testable import ExampleModel

class NetworkSpec: QuickSpec {
    override func spec() {
        var network: Network!
        beforeEach {
            network = Network()
        }
        
        describe("JSON") {
            it("eventually gets JSON data as specified with parameters.") {
                var json: [String: AnyObject]? = nil
                let url = "https://httpbin.org/get"
                network.requestJSON(url, parameters: ["a": "b", "x": "y"])
                    .on(next: { json = $0 as? [String: AnyObject] })
                    .start()
                
                expect(json).toEventuallyNot(beNil(), timeout: 5)
                expect((json?["args"] as? [String: AnyObject])?["a"] as? String)
                    .toEventually(equal("b"), timeout: 5)
                expect((json?["args"] as? [String: AnyObject])?["x"] as? String)
                    .toEventually(equal("y"), timeout: 5)
            }
            it("eventually gets an error if the network has a problem.") {
                var error: NetworkError? = nil
                let url = "https://not.existing.server.comm/get"
                network.requestJSON(url, parameters: ["a": "b", "x": "y"])
                    .on(error: { error = $0 })
                    .start()
                
                expect(error)
                    .toEventually(equal(NetworkError.NotReachedServer), timeout: 5)
            }
        }
    }
}
