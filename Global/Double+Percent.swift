//
//  Double+Percent.swift
//  Global
//
//  Created by Perso on 4/6/24.
//

import Foundation

public extension Double {
    var percent: String {
        let formattedNumber = String(format: "%.0f", self*100)
        return "\(formattedNumber)%"
    }
}
