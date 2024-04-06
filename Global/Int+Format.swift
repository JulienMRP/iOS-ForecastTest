//
//  Int+Format.swift
//  Global
//
//  Created by Perso on 4/6/24.
//

import Foundation

public extension Int {
    var time: String {
        let (hours, seconds) = self.quotientAndRemainder(dividingBy: 3600)
        let formattedHours = String(format: "%02d", hours)
        let formattedMinutes = String(format: "%02d", seconds/60)
        return "\(formattedHours):\(formattedMinutes)"
    }
    
    var temperature: String {
        "\(self)°C"
    }
}
