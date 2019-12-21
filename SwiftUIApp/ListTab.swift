//
//  ListTab.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 05.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import SwiftUI

struct ListTab: View {
	@EnvironmentObject var storage: ListStorage
	@Binding var selectedItem: Int?
	@State var selectedSegment = 0
	
    var body: some View {
		NavigationView {
			VStack {
				SegmentedControl(titles: ["Charachters", "Episodes"], selectedIndex: $selectedSegment)
				if selectedSegment == 0 {
					List(storage.characters) { charachter in
						VStack(alignment: .leading) {
							Text(charachter.name)
							// Loading
							if self.storage.isNewCharactersPageLoading && self.storage.characters.isLastItem(charachter) {
								Divider()
								Text("Loading...")
							}
						}.onAppear {
							self.onItemShowed(charachter)
						}
					}
				} else {
					List(storage.episodes) { episode in
						VStack(alignment: .leading) {
							Text(episode.name)
							// Loading
							if self.storage.isNewEpisodesPageLoading && self.storage.episodes.isLastItem(episode) {
								Divider()
								Text("Loading...")
							}
						}.onAppear {
							self.onItemShowed(episode)
						}
					}
				}
			}
            .navigationBarTitle("Rick and Morty")
		}
    }
}

extension ListTab {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        if selectedSegment == 0, self.storage.characters.isLastItem(item) {
            self.storage.fetchCharactersData()
        } else if selectedSegment == 1, self.storage.episodes.isLastItem(item) {
            self.storage.fetchEpisodesData()
        }
    }
}
