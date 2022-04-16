//
//  LocationPreviewView.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/10/22.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    var brandGradient = Gradient(colors: [Color("Blue"), Color("LightGreen")])

    var body: some View {
            HStack(alignment: .bottom, spacing: 0.0) {
                VStack(alignment: .leading, spacing: 16.0) {
                    imageSection
                    titleSection
                }
                
                VStack(spacing: 8.0) {
                    learnMoreButton
                    nextButton
                }
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(.ultraThinMaterial)
                    .offset(y: 65)
                )
            .cornerRadius(30)
    }
}
/*
struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations[0])
    }
}
*/

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(30)
            }
        }
        .padding(6)
        .background(LinearGradient(gradient: brandGradient, startPoint: .leading, endPoint: .trailing))
        .cornerRadius(30)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var learnMoreButton: some View {
        Button {
            
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
        .accentColor(Color("Green"))
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
        .accentColor(Color("Green"))
    }
    
}
