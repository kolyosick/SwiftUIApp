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
			Button(action: {
					self.selection = 1
					self.selectedItem = 1
				}) {
					Text("Open second tab")
				}
				.tabItem {
					VStack {
						Text("Button")
                        Image(systemName: "arrowshape.turn.up.right")
					}
				}
				.tag(0)
			SecondTab(selectedItem: $selectedItem)
				.tabItem {
					VStack {
						Text("List")
                        Image(systemName: "tray.full")
					}
				}
				.tag(1)
			ThirdTab()
				.tabItem {
					VStack {
						Text("Modal")
						Image(systemName: "shift")
					}
				}
				.tag(2)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
