//
//  ThirdTab.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 05.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import SwiftUI

struct ThirdTab: View {
	@State private var showModal: Bool = false
	
    var body: some View {
        Button(action: {
            self.showModal = true
        }) {
            Text("Показать модальное окно")
		}.betterSheet(isPresented: self.$showModal,  onDismiss: { print("Modal dismissed") }) {
            ModalView()
        }
    }
}

struct ThirdTab_Previews: PreviewProvider {
    static var previews: some View {
        ThirdTab()
    }
}

struct ModalView: View {
 
    var body: some View {
        Text("Всё ок")
    }
    
}
