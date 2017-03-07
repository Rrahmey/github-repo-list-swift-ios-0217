//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositories(with completion: @escaping ([[String:Any]]) -> ()
        ) {
        
        let urlString = "https://api.github.com/repositories?\(clientID)=YOUR_KEY&\(clientSecret)=YOUR_SECRET"
        print(urlString)
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url, completionHandler: {(data, response, error) in
                
                if let unWrappedData = data {
                    print(unWrappedData)
                    
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: unWrappedData, options: []) as? [[String:Any]] ?? [[:]]
                        //print("response json \n\n \(responseJSON)")
                        
                        completion(responseJSON)
                        }
                    catch {
                        
                    }
                    
                }
                
            })
            
            dataTask.resume()
        }
        
    }
}




