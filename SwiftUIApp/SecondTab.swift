//
//  SecondTab.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 05.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import SwiftUI

struct SecondTab: View {
    var body: some View {
		NavigationView {
			VStack {
				List {
					NavigationLink(destination: DetailView()) {
						Text("Первая строка")
					}
					NavigationLink(destination: DetailView()) {
						Text("Вторая строка")
					}
					NavigationLink(destination: DetailView()) {
						Text("Третья строка")
					}
				}
			}
			.navigationBarHidden(false)
            .navigationBarTitle("List")
		}
    }
}

struct SecondTab_Previews: PreviewProvider {
    static var previews: some View {
        SecondTab()
    }
}
