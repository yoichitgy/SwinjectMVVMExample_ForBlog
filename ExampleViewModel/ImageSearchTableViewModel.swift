//
//  ImageSearchTableViewModel.swift
//  SwinjectMVVMExample
//
//  Created by Yoichi Tagaya on 9/1/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import ExampleModel

public final class ImageSearchTableViewModel: ImageSearchTableViewModeling {
    private let imageSearch: ImageSearching
    
    public init(imageSearch: ImageSearching) {
        self.imageSearch = imageSearch
    }
}
