//
//  ApiServices.swift
//  rickMorty
//
//  Created by Alexandre on 09.07.21.
//

import Foundation
import Alamofire
final class ApiServices { static func load<T: Decodable>(url: URL, model: T.Type, completion: @escaping (T?) -> ()) {
        AF.request(url).responseDecodable(of: model) { result in
            completion(result.value)
            
        }
}
}
