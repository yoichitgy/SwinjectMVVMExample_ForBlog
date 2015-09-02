//
//  AppDelegateSpec.swift
//  SwinjectMVVMExample
//
//  Created by Yoichi Tagaya on 9/1/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import Quick
import Nimble
import Swinject
import ExampleModel
import ExampleViewModel
import ExampleView
@testable import SwinjectMVVMExample

class AppDelegateSpec: QuickSpec {
    override func spec() {
        var container: Container!
        beforeEach {
            container = AppDelegate().container
        }
        
        describe("Container") {
            it("resolves every service type.") {
                // Models
                expect(container.resolve(Networking.self)).notTo(beNil())
                expect(container.resolve(ImageSearching.self)).notTo(beNil())
                
                // ViewModels
                expect(container.resolve(ImageSearchTableViewModeling.self))
                    .notTo(beNil())
            }
            it("injects view models to views.") {
                let bundle = NSBundle(forClass: ImageSearchTableViewController.self)
                let storyboard = SwinjectStoryboard.create(
                    name: "Main",
                    bundle: bundle,
                    container: container)
                let imageSearchTableViewController = storyboard
                    .instantiateViewControllerWithIdentifier("ImageSearchTableViewController")
                    as! ImageSearchTableViewController
                
                expect(imageSearchTableViewController.viewModel).notTo(beNil())
            }
        }
    }
}
