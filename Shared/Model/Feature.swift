//
//  Feature.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/7/22.
//

import SwiftUI

struct FeatureComp: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
    //var selection: FeatureType
    
}

var mainfeature = [
    FeatureComp(index: 1, title: "Scan-A-Bin", subtitle: "Augmented Reality", text: "Scan your recycling bin's Recycle Right code and get...", image: "ARCamera", background: "Wavy 1", logo: "Badge-ARkit"),
    FeatureComp(index: 2, title: "Learn to Compost", subtitle: "20 sections - 3 hours", text: "Step-by-step guide to composting using RecycleRight's custom biogas digester ...", image: "compostbin", background: "Wavy 2", logo: "Logo 4"),
    FeatureComp(index: 3, title: "E-Waste Disposal Map", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", background: "Wavy 3", logo: "Logo 1"),
    FeatureComp(index: 4, title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Wavy 4", logo: "Logo 3"),
]
/*
var featuredCourses = [
    Course(index: 1, title: "Plastics", subtitle: "20 sections - 3 hours", text: "Recycling plastic is tougher than you think ;) it can require meticulous inspection and whatnot...", image: "plastic-bag", background: "Wavy 5", logo: "Logo 2"),
    Course(index: 2, title: "Cardboard", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "box", background: "Wavy 4", logo: "Logo 3"),
    Course(index: 3, title: "Paper", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "paper", background: "Wavy 1", logo: "Logo 4"),
    Course(index: 4, title: "Cans", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "cola", background: "Wavy 2", logo: "Logo 1"),
]
*/
