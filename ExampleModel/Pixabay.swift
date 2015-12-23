//
//  Pixabay.swift
//  SwinjectMVVMExample
//
//  Created by Yoichi Tagaya on 8/30/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

internal struct Pixabay {
    internal static let apiURL = "https://pixabay.com/api/"
    
    internal static var requestParameters: [String: AnyObject] {
        return [
            "key": Config.apiKey,
            "image_type": "photo",
            "safesearch": true,
            "per_page": 50,
        ]
    }
}
