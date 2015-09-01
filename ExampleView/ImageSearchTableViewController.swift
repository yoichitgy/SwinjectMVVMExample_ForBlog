//
//  ImageSearchTableViewController.swift
//  SwinjectMVVMExample
//
//  Created by Yoichi Tagaya on 9/1/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import UIKit
import ExampleViewModel

public final class ImageSearchTableViewController: UITableViewController {
    private var autoSearchStarted = false
    
    public var viewModel: ImageSearchTableViewModeling? {
        didSet {
            if let viewModel = viewModel {
                viewModel.cellModels.producer
                    .on(next: { _ in self.tableView.reloadData() })
                    .start()
            }
        }
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if !autoSearchStarted {
            autoSearchStarted = true
            viewModel?.startSearch()
        }
    }
}

// MARK: UITableViewDataSource
extension ImageSearchTableViewController {
    public override func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int
    {
        if let viewModel = viewModel {
            return viewModel.cellModels.value.count
        }
        return 0
    }
    
    public override func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "ImageSearchTableViewCell",
            forIndexPath: indexPath) as! ImageSearchTableViewCell
        if let viewModel = viewModel {
            cell.viewModel = viewModel.cellModels.value[indexPath.row]
        }
        else {
            cell.viewModel = nil
        }
        
        return cell
    }
}
