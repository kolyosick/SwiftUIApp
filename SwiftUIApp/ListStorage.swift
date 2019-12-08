//
//  ListStorage.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 08.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import Foundation

class ListStorage: ObservableObject {
	@Published private(set) var items = [ListItem(id: "0", name: "First item"),
										 ListItem(id: "1", name: "Second item"),
										 ListItem(id: "2", name: "Third item")]
}
