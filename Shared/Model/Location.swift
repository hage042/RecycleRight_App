//
//  Locations.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/10/22.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        // name = "Colosseum"
        // CityName = "Rome"
        // id = "ColosseumRome"
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}


