//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by SABBIR HOSSAIN on 29/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Dhaka, Bangladesh")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: "32°")
                
                HStack (spacing: 20) {
                    DayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: "30°")
                    DayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: "38°")
                    DayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: "20°")
                    DayView(dayOfWeek: "FRI", imageName: "snow", temperature: "28°")
                    DayView(dayOfWeek: "SAT", imageName: "sunset.fill", temperature: "30°")
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change the day time", backgroundColor: .white, foregroundColor: .accentColor)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .regular, design: .default))
                .foregroundStyle(.white)
                .padding(.bottom, 10)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text(temperature)
                .font(.system(size: 22, weight: .semibold, design: .default))
                .foregroundStyle(.white)
        }
    }
}


struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("AppBlue")], startPoint: .top, endPoint: .bottom)
//            .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}


struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .serif))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temp: String
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text(temp)
                .font(.system(size: 70, weight: .semibold, design: .default))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}



