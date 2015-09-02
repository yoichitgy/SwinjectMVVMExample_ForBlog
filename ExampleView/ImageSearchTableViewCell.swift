//
//  ImageSearchTableViewCell.swift
//  SwinjectMVVMExample
//
//  Created by Yoichi Tagaya on 9/1/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import UIKit
import ExampleViewModel

internal final class ImageSearchTableViewCell: UITableViewCell {
    internal var viewModel: ImageSearchTableViewCellModeling? {
        didSet {
            tagLabel.text = viewModel?.tagText
            imageSizeLabel.text = viewModel?.pageImageSizeText
        }
    }
        
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var imageSizeLabel: UILabel!
}
