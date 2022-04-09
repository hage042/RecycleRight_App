//
//  Tab.swift
//  Tab
//
//  Created by Meng To on 2021-08-18.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Learn Now", icon: "house", color: Color("Green"), selection: .home),
    TabItem(name: "Explore", icon: "magnifyingglass", color: Color(red: 0.048, green: 0.757, blue: 0.834), selection: .explore),
    TabItem(name: "Community", icon: "bell", color: Color("Green"), selection: .notifications),
    TabItem(name: "Scan", icon: "rectangle.stack", color: Color(red: 0.048, green: 0.757, blue: 0.834), selection: .library)
]

enum Tab: String {
    case home
    case explore
    case notifications
    case library
}
