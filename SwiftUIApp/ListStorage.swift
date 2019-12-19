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
	@Published private(set) var items: [Character] = []
	@Published var pageIndex: Int = 0
    @Published var isNewPageLoading = false
	
	init() {
		fetchData()
	}
	
	func fetchData() {
		guard isNewPageLoading == false else {
            return
        }
        isNewPageLoading = true
        self.pageIndex += 1
		
		service.loadCharachters(page: pageIndex) { charachters, error in
			self.items.append(contentsOf: charachters ?? [])
            self.isNewPageLoading = false
		}
	}
}
