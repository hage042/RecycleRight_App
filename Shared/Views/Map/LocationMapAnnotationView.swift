//
//  LocationMapAnnotationView.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/10/22.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var brandGradient = Gradient(colors: [Color("Blue"), Color("LightGreen")])
    let accentColor = Color("Green")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(LinearGradient(gradient: brandGradient, startPoint: .leading, endPoint: .trailing))
                .cornerRadius(36)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
