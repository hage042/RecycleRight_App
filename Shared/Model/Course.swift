//
//  Course.swift
//  iOS15
//
//  Created by Meng To on 2021-06-18.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
    var selectedMaterial: Array<CourseSection>
    
}

var courses = [
    Course(index: 1, title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 5", background: "Wavy 1", logo: "Logo 2", selectedMaterial: plasticCourse),
    Course(index: 2, title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 3", background: "Wavy 2", logo: "Logo 4", selectedMaterial: plasticCourse),
    Course(index: 3, title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", background: "Wavy 3", logo: "Logo 1", selectedMaterial: plasticCourse),
    Course(index: 4, title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Wavy 4", logo: "Logo 3", selectedMaterial: plasticCourse),
]

var featuredCourses = [
    Course(index: 1, title: "Plastics", subtitle: "20 sections - 3 hours", text: "Recycling plastic is tougher than you think ;) it can require meticulous inspection and whatnot...", image: "plastic-bag", background: "Wavy 5", logo: "Logo 2", selectedMaterial: plasticCourse),
    Course(index: 2, title: "Cardboard", subtitle: "20 sections - 3 hours", text: "Cardboard is usally recycleable, but there are certain things that your local recycling centers...", image: "box", background: "Wavy 4", logo: "Logo 3", selectedMaterial: cardboardCourse),
    Course(index: 3, title: "Paper", subtitle: "20 sections - 3 hours", text: "You will almost always be able to recycle paper unless ...", image: "paper", background: "Wavy 1", logo: "Logo 4", selectedMaterial: paperCourse),
    Course(index: 4, title: "Cans", subtitle: "20 sections - 3 hours", text: "Should you rinse your cans before recycling? What about crushing them? Learn more about...", image: "cola", background: "Wavy 2", logo: "Logo 1", selectedMaterial: cansCourse),
]
/*
enum FeatureType: String {
    case home
    case explore
    case notifications
    case library
}
*/
