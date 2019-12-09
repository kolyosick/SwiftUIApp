//
//  DetailView.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 05.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import SwiftUI

struct DetailView: View {
	var text: String
	
    var body: some View {
		Text(verbatim: text)
    }
}
