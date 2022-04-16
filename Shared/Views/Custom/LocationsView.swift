//
//  LocationsView.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/10/22.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    var isAnimated = true
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var model: Model
    
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37, longitude: -121), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion,
                showsUserLocation: true,
                annotationItems: vm.locations,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            })
                .ignoresSafeArea()
                .onAppear {
                    vm.checkIfLocationServicesEnabled()
                }
                .accentColor(Color("LightGreen"))
            VStack(spacing: 0) {
                HStack{
                    header
                        .padding()
                }
                                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    
    private var header: some View {
        HStack {
            VStack {
                    Button(action: vm.toggleLocationsList) {
                        Text(vm.mapLocation.name)
                            .font(.title2)
                            .fontWeight(.black)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .foregroundColor(.primary)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .overlay(alignment: .leading) {
                                Image(systemName: "arrow.down")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .padding()
                                    .rotationEffect(Angle(degrees:
                                                            vm.showLocationsList ? 180 : 0))
                            }
                    }
                
                if vm.showLocationsList {
                    LocationsListView()
                }
            }
            .background(.ultraThinMaterial)
            .cornerRadius(30)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        }
    }
}
