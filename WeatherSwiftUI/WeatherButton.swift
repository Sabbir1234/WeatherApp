//
//  WeatherButton.swift
//  WeatherSwiftUI
//
//  Created by SABBIR HOSSAIN on 29/10/24.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
    }
}

