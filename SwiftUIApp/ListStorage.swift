//
//  ListStorage.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 08.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import Foundation

class ListStorage: ObservableObject {
	let service = RickMortyService()
	@Published private(set) var characters: [Character] = []
	@Published private(set) var episodes: [Episode] = []
	@Published var charactersPageIndex: Int = 0
	@Published var episodesPageIndex: Int = 0
    @Published var isNewEpisodesPageLoading = false
	@Published var isNewCharactersPageLoading = false
	
	init() {
		fetchCharactersData()
		fetchEpisodesData()
	}
	
	func fetchCharactersData() {
		guard isNewCharactersPageLoading == false else {
            return
        }
        isNewCharactersPageLoading = true
        self.charactersPageIndex += 1
		
		service.loadCharachters(page: charactersPageIndex) { charachters, error in
			self.characters.append(contentsOf: charachters ?? [])
            self.isNewCharactersPageLoading = false
		}
	}
	
	func fetchEpisodesData() {
		guard isNewEpisodesPageLoading == false else {
            return
        }
        isNewEpisodesPageLoading = true
        self.episodesPageIndex += 1
		
		service.loadEpisodes(page: episodesPageIndex) { episodes, error in
			self.episodes.append(contentsOf: episodes ?? [])
            self.isNewEpisodesPageLoading = false
		}
	}
}
