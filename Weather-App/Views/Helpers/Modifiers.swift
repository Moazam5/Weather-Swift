//
//  Modifiers.swift
//  Weather-App
//
//  Created by Moazam Mir on 1/24/21.
//

import Foundation
import SwiftUI

struct CardModifier : ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(8)
            .shadow(color: .init(.sRGB, white: 0, opacity: 0.40), radius: 4, x: 0, y: 4)
            
    }
    
    
}
