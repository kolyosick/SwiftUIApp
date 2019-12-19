//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 28.11.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State private var selection = 0
	@State var selectedItem: Int?
	
    var body: some View {
		TabView(selection: $selection) {
			ListTab(selectedItem: $selectedItem)
				.environmentObject(ListStorage())
				.tabItem {
					VStack {
						Text("Rick and Morty")
                        Image(systemName: "tray.full")
					}
				}
				.tag(0)
			ThirdTab()
				.tabItem {
					VStack {
						Text("Modal")
						Image(systemName: "shift")
					}
				}
				.tag(1)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
