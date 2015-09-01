//
//  ImageSearching.swift
//  SwinjectMVVMExample
//
//  Created by Yoichi Tagaya on 8/30/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import ReactiveCocoa

public protocol ImageSearching {
    func searchImages() -> SignalProducer<ResponseEntity, NetworkError>
}
