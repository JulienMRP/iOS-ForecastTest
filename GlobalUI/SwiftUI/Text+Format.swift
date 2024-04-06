//
//  Text+Format.swift
//  GlobalUI
//
//  Created by Perso on 4/6/24.
//

import SwiftUI

extension Text {
    public func forecastInfoFont(bold: Bool = true) -> some View {
        self
            .font(.system(size: 32, weight: bold ? .bold : .regular))
            .foregroundStyle(.white)
    }
    
    public func forecastLabelFont() -> some View {
        self
            .font(.system(size: 12))
            .foregroundStyle(.gray)
    }
}
