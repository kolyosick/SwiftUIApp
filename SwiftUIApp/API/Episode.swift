//
//  Episode.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 21.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import Marshal

struct Episode: Identifiable {
	var id: Int
	var name: String
}

extension Episode: Unmarshaling {
	public init(object: MarshaledObject) throws {
		id = try object.value(for: "id")
		name = try object.value(for: "name")
	}
}
