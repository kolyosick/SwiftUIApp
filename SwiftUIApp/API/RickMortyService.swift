//
//  RickMortyService.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 19.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import Marshal
import Alamofire
import Foundation

class RickMortyService {
	static var basePath = "https://rickandmortyapi.com/api"
	
	func loadCharachters(page: Int, completion: @escaping ((_ data: [Character]?,_ error: Error?) -> Void)) {
		
		Alamofire.request(RickMortyService.basePath + "/character/",
						  method: .get,
						  parameters: ["page": page]).responseJSON { response in
			switch response.result {
			case .success:
				if let JSON = response.result.value as? [String : AnyObject], let results = JSON["results"] as? [[String : AnyObject]] {
					var characters = [Character]()
					for dict in results {
						if let character = try? Character.value(from: dict) {
							characters.append(character)
						}
					}
					completion(characters, nil)
				} else {
					completion(nil, nil)
				}
			case .failure(let error):
				print(error)
				completion(nil, error)
			}
		}
	}
}
