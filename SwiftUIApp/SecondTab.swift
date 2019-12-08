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
	
    var body: some View {
		NavigationView {
			VStack {
				List {
					ForEach(storage.items) { item in
						NavigationLink(destination: DetailView()) {
							Text(item.name)
						}
					}
				}
			}
			.navigationBarHidden(false)
            .navigationBarTitle("List")
		}
    }
}
