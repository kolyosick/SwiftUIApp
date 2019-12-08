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
	
    var body: some View {
		TabView(selection: $selection) {
			FirstTab()
				.tabItem {
					VStack {
						Text("Button")
                        Image(systemName: "arrowshape.turn.up.right")
					}
				}
				.tag(0)
			SecondTab()
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
