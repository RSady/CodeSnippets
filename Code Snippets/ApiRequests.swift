//
//  ApiRequests.swift
//  Code Snippets
//
//  Created by Ryan Sady on 6/9/18.
//  Copyright © 2018 Ryan Sady. All rights reserved.
//

import Foundation

//Create API Call
func apiCall(completion: @escaping (Bool) -> Void) {
    var success = false
    
    guard let urlString = URL(string: "https url") else {
        print("No URL")
        return
    }
    
    guard let token = UserDefaults.standard.value(forKey: "authToken")  else {
        print("No Auth Token")
        return
    }
    
    let postString = "token=\(token)&add other post data"
    var request = URLRequest(url: urlString)
    request.httpMethod = "POST"
    request.httpBody = postString.data(using: .utf8)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if error != nil {
            print("Error: ", error.debugDescription)
            //Handle Error
        }
        
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
            //Handle HTTP Error
            print("Status Code should be 200, but is \(httpStatus.statusCode)")
        }
        
        //Parse JSON Data Here
        
        //Run Checks to Validate Data with 'success' variable
        
        //Completion
        completion(success)
        
        }.resume()
}

//Simple API Call with Swifty JSON
func getJsonData(from url: String, with postString: String) -> JSON? {
    let urlData = "url"
    var jsonData: JSON?
    guard let urlString = URL(string: urlData) else {
        fatalError("No URL")
    }
    
    var request = URLRequest(url: urlString)
    request.httpMethod = "POST"
    request.httpBody = postString.data(using: .utf8)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if error != nil {
            print("Error: ", error.debugDescription)
            return
        }
        
        if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
            //HTTP Error
            print("Status Code should be 200, but is \(httpStatus.statusCode)")
        }
        
        do {
            let jData = try JSON(data: data!)
            let jsonData = jData
            print("Data:")
            print(jsonData)
            
        } catch {
            print("JSON Error!: \(error.localizedDescription)")
            print(error)
        }
        
        }.resume()
    
    return jsonData
}
