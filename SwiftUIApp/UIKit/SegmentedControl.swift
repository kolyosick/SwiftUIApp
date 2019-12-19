//
//  SegmentedControl.swift
//  SwiftUIApp
//
//  Created by Nikolay Alexeyev on 19.12.2019.
//  Copyright © 2019 Otus. All rights reserved.
//

import SwiftUI
import UIKit

struct SegmentedControl: UIViewRepresentable {
    
	var titles: [String]
    @Binding var selectedIndex: Int
    
    func makeCoordinator() -> SegmentedControl.Coordinator {
        return Coordinator(parent: self)
    }
    
    func updateUIView(_ uiView: UISegmentedControl, context: UIViewRepresentableContext<SegmentedControl>) {
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<SegmentedControl>) -> UISegmentedControl {
		let sc = UISegmentedControl.init(items: titles)
        sc.selectedSegmentIndex = 0
        sc.addTarget(context.coordinator, action: #selector(Coordinator.handleValueChange), for: .valueChanged)
        return sc
    }
    
    class Coordinator: NSObject {
        let parent: SegmentedControl
        init(parent: SegmentedControl) {
            self.parent = parent
        }
        
        @objc func handleValueChange(control: UISegmentedControl) {
            withAnimation(.default, {
                self.parent.selectedIndex = control.selectedSegmentIndex
            })
            
        }
    }
    
}
