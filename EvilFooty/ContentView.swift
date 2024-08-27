//
//  ContentView.swift
//  EvilFooty
//
//  Created by Brett Moxey on 26/8/2024.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 1
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.secondarySystemBackground
        
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.systemFont(ofSize: 30, weight: .bold)
        ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.secondarySystemBackground
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    var body: some View {
        VStack {
            Text("Evildudes Footytips")
                .font(.title)
                .foregroundStyle(Color(UIColor.systemBlue))
            TabView(selection: $selectedIndex) {
                CurrentView()
                    .tabItem {
                        Label("Current Champ", systemImage: "trophy")
                    }
                HistoryView()
                    .tabItem {
                        Label("Previous", systemImage: "list.bullet")
                    }
                ChartView()
                    .tabItem {
                        Label("Chart", systemImage: "chart.bar.xaxis")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
