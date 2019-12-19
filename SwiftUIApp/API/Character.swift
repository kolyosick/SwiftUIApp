//
//  Character.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 19.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import Marshal

struct Character: Identifiable {
	var id: Int
	var name: String
	var image: String
}

extension Character: Unmarshaling {
	public init(object: MarshaledObject) throws {
		id = try object.value(for: "id")
		name = try object.value(for: "name")
		image = try object.value(for: "image")
	}
}
