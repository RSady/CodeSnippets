//
//  CoreDataSnippets.swift
//  Code Snippets
//
//  Created by Ryan Sady on 6/9/18.
//  Copyright © 2018 Ryan Sady. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func createImage() -> UIImage {
    
    if let imageData = CoreDataItem as? NSData{
        let newImage = UIImage(data: imageData as Data)
        return newImage
    } else {
        print("Error Loading Image Data")
    }

}


func createFrc() {
    
}
