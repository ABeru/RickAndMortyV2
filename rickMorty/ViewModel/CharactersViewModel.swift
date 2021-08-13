//
//  CharactersViewModel.swift
//  rickMorty
//
//  Created by Alexandre on 09.07.21.
//

import Foundation
class CharactersViewModel {
    var characters = [CharactersM]()
    var filtered = [CharactersM]()
    var charIds: [Int]
    var selectedIndex = 0
    var passedArray = [CharactersM]()
    var episode: EpisodeRes
    var datasource: CollViewDataSource<CharactersCell, CharactersM>!
    init(charIds: [Int], episode: EpisodeRes) {
        self.charIds = charIds
        self.episode = episode
    }
    func modelAt(_ index: Int) {
        selectedIndex = index
    }
    func search(_ query: String) {
        if query.isEmpty == false {
            filtered.removeAll()
            filterChar(for: query)
        }
    }
    func fetchChar(completion: @escaping () -> Void) {
        Repos.callApiForChar(ids: charIds, completion:{ (result) in
            if result != nil {
                self.characters.append(contentsOf: result!)
                self.passedArray = self.characters
              completion()
            }
        })
        
    }
    func filterChar(for query: String) {
        Repos.callApiForFilterChar(query: query, completion: { (result) in
            if result != nil {
                self.filtered.append(contentsOf: result!.results)
            }
        })
}
}
