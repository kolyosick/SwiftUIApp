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
				List(storage.items) { charachter in
					VStack(alignment: .leading) {
						Text(charachter.name)
						// Loading
						if self.storage.isNewPageLoading && self.storage.items.isLastItem(charachter) {
							Divider()
							Text("Loading...")
						}
					}.onAppear {
						self.onItemShowed(charachter)
					}
				}
			}
            .navigationBarTitle("Rick and Morty")
		}
    }
}

extension ListTab {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        if self.storage.items.isLastItem(item) {
            self.storage.fetchData()
        }
    }
}
