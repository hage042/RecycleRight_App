//
//  Topic.swift
//  Topic
//
//  Created by Meng To on 2021-08-05.
//

import SwiftUI

struct Topic: Identifiable {
    let id = UUID()
    var title: String
    var icon: String
}

var topics = [
    Topic(title: "Environmental News", icon: "iphone"),
    Topic(title: "Events Near You", icon: "eyedropper"),
    Topic(title: "Recycling Day Instructions", icon: "laptopcomputer")
]
