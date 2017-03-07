//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    fileprivate init () {}
    var repositories = [GithubRepository]()
   
    
    func getRepositoriesFromAPI(completion: @escaping () -> ()) {
        repositories = []
        GithubAPIClient.getRepositories { (jSON) in
            for dict in jSON {
                let repositoryDict = GithubRepository(dictionary: dict)
                self.repositories.append(repositoryDict)
                
            }
            completion()

        }

    }
}
