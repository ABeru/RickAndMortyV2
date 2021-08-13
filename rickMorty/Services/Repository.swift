//
//  Repos.swift
//  rickMorty
//
//  Created by Alexandre on 04.08.21.
//

import Foundation
final class Repos {
    
    static func callApiForChar(ids: [Int],completion: @escaping ([CharactersM]?) -> ()) {
        guard let url = Constants.Urls.urlForChar(apiAddress: Constants.apiAddress,ids: ids) else {return}
        ApiServices.load(url: url, model: [CharactersM].self, completion: { result in
            completion(result)
        })
    }
    
    static func callApiForEpisodes(completion: @escaping (Episodes?) -> ())  {
        guard let url = Constants.Urls.urlForEpisodes(apiAddress: Constants.apiAddress) else {return}
        ApiServices.load(url: url, model: Episodes.self, completion: { result in
            completion(result)
        })
    }
    static func callApiForEpisode(ids: [Int],completion: @escaping ([EpisodeRes]?) -> ())  {
        guard let url = Constants.Urls.urlForEpisode(apiAddress: Constants.apiAddress, ids: ids) else {return}
        ApiServices.load(url: url, model: [EpisodeRes].self, completion: { result in
            completion(result)
        })
    }
    static func callApiForFilterChar(query: String,completion: @escaping (FilterM?) -> ()) {
        guard let url = Constants.Urls.urlForFilterChar(apiAddress: Constants.apiAddress, query: query) else {return}
        ApiServices.load(url: url, model: FilterM.self, completion: { result in
            completion(result)
        })

    }
    static func callApiForFilterEp(query: String,completion: @escaping (Episodes?) -> ()) {
        guard let url = Constants.Urls.urlForFilterEp(apiAddress: Constants.apiAddress, query: query) else {return}
        ApiServices.load(url: url, model: Episodes.self, completion: { result in
            completion(result)
        })
    }
    static func callApiForSingleEp(id: Int,completion: @escaping (EpisodeRes?) -> ())  {
        guard let url = Constants.Urls.urlForSingleEp(apiAddress: Constants.apiAddress, id: id) else {return}
        ApiServices.load(url: url, model: EpisodeRes.self, completion: { result in
            completion(result)
        })
    }
    
}
