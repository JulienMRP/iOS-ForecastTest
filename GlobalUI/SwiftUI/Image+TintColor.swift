//
//  Image+TintColor.swift
//  GlobalUI
//
//  Created by Perso on 4/6/24.
//

import SwiftUI

extension Image {
    public func tintImage(_ color: Color) -> some View {
        self
            .renderingMode(.template)
            .foregroundColor(color)
    }
}
