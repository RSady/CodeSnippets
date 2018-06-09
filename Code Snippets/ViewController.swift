//
//  ViewController.swift
//  Code Snippets
//
//  Created by Ryan Sady on 6/9/18.
//  Copyright © 2018 Ryan Sady. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    //Create FetchedResultsController for CoreData
    lazy var fetchedResultsController: NSFetchedResultsController<DataModel> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<DataModel> = Alarm.fetchRequest()
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "sort by", ascending: true)]
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()

    //Create & Present Popover from Existing View Controller
    func presentPopover() {
        //Must Implement Delegates! - UIPopoverPresentantionControllerDelegate
        let popOverContent = storyboard?.instantiateViewController(withIdentifier: "vcIdentifier") as? ViewController
        let nav = UINavigationController(rootViewController: popOverContent!)
        nav.modalPresentationStyle = .popover
        let popover = nav.popoverPresentationController
        nav.isNavigationBarHidden = true
        popover?.delegate = self
        popover?.sourceView = view
        popOverContent?.preferredContentSize = CGSize(width: view.frame.width / 1.25, height: view.frame.height / 1.25)
        popover?.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
        popover?.permittedArrowDirections = .init(rawValue: 0)
        
        self.present(nav, animated: true, completion: nil)
    }
    
    
    

}

