//
//  SecondTab.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 05.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import SwiftUI

struct SecondTab: View {
	@ObservedObject var storage = ListStorage()
	@Binding var selectedItem: Int?
	
    var body: some View {
		NavigationView {
			VStack {
				List {
					ForEach(storage.items.indices) { index in
						NavigationLink(destination: DetailView(), tag: index, selection: self.$selectedItem) {
							Text(self.storage.items[index].name)
						}
					}
				}
			}
			.navigationBarHidden(false)
            .navigationBarTitle("List")
		}
    }
}
