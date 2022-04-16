//
//  HomeView.swift
//  iOS15
//
//  Created by Meng To on 2021-06-22.
//

import SwiftUI

struct HomeView: View {
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    
    @State var show = false
    @State var showStatusBar = true
    @State var showCourse = false
    @State var selectedCourse: Course = courses[0]
    @State var selectedFeature: FeatureComp = mainfeature[0]
    @State var contentHasScrolled = false
    
    @EnvironmentObject var model: Model
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            if model.showDetail {
                detail
            }
            
            ScrollView {
                scrollDetection
                
                Rectangle()
                    .frame(width: 100, height: 72)
                    .opacity(0)
                
                    
                TabView{
                    scanabin
                    ewastemap
                    compostintro
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 460)
                .background(
                    Image("Blob 1")
                        .offset(x: 250, y: -100)
                        .accessibility(hidden: true)
                )
                
                //featured
                
                Text("Recycleable Info".uppercased())
                    .sectionTitleModifier()
                    .offset(y: -80)
                    .accessibilityAddTraits(.isHeader)
                
                if model.showDetail {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(courses) { course in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow").opacity(0.2), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                        }
                    }
                    .padding(.horizontal, 20)
                    .offset(y: -80)
                } else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        course.frame(height: 300)
                    }
                    .padding(.horizontal, 20)
                    .offset(y: -80)
                }
            }
            .coordinateSpace(name: "scroll")
        }
        .onChange(of: model.showDetail) { value in
            withAnimation {
                model.showTab.toggle()
                model.showNav.toggle()
                showStatusBar.toggle()
            }
        }
        .overlay(NavigationBar(title: "Featured", contentHasScrolled: $contentHasScrolled))
        .statusBar(hidden: !showStatusBar)
    }
    
    var detail: some View {
        ForEach(featuredCourses) { course in
            if course.index == model.selectedCourse {
                CourseView(namespace: namespace, selectedMaterial: course.selectedMaterial, course: .constant(course))
            }
        }
    }
    
    var course: some View {
        ForEach(featuredCourses) { course in
            CourseItem(namespace: namespace, course: course)
                .accessibilityElement(children: .combine)
                .accessibilityAddTraits(.isButton)
        }
    }
    
    var compostintro: some View {
        TabView{
            GeometryReader { proxy in
                let feature = mainfeature[1]
                FeatureItemMP(feature: feature)
                    .cornerRadius(30)
                    .modifier(OutlineModifier(cornerRadius: 30))
                    .rotation3DEffect(
                        .degrees(proxy.frame(in: .global).minX / -10),
                        axis: (x: 0, y: 1, z: 0), perspective: 1
                    )
                    .shadow(color: Color("Shadow").opacity(0.3),
                            radius: 30, x: 0, y: 30)
                    .blur(radius: abs(proxy.frame(in: .global).minX) / 40)
                    .overlay(
                        LottieView(filename: "compostLogoSpin")
                            .aspectRatio(contentMode: .fit)
                            .offset(x: 32, y: -80)
                            .frame(height: 230)
                            .offset(x: proxy.frame(in: .global).minX / 2)
                    )
                    .padding(20)
                    .onTapGesture {
                        showCourse = true
                        selectedFeature = feature
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 460)
        .sheet(isPresented: $showCourse) {
            CompostIntroView(namespace: namespace, course: $selectedCourse, isAnimated: false)
        }
    }
    
    var scanabin: some View {
        TabView{
            GeometryReader { proxy in
                let feature = mainfeature[0]
                FeatureItemMP(feature: feature)
                    .cornerRadius(30)
                    .modifier(OutlineModifier(cornerRadius: 30))
                    .rotation3DEffect(
                        .degrees(proxy.frame(in: .global).minX / -10),
                        axis: (x: 0, y: 1, z: 0), perspective: 1
                    )
                    .shadow(color: Color("Shadow").opacity(0.3),
                            radius: 30, x: 0, y: 30)
                    .blur(radius: abs(proxy.frame(in: .global).minX) / 40)
                    .overlay(
                        LottieView(filename: "trashbin")
                            .aspectRatio(contentMode: .fill)
                            .offset(x: 32, y: -80)
                            .frame(height: 250)
                            .offset(x: proxy.frame(in: .global).minX / 2)
                    )
                    .padding(20)
                    .overlay(
                        LottieView(filename: "scannerAnimationWhiteFull")
                            .aspectRatio(contentMode: .fit)
                            .offset(x: 32, y: -60)
                            .frame(height: 180)
                            .offset(x: proxy.frame(in: .global).minX / 2)
                    )
                    .padding(20)
                    .onTapGesture {
                        showCourse = true
                        selectedFeature = feature
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 460)
        .sheet(isPresented: $showCourse) {
            ScanABinView(namespace: namespace, course: $selectedCourse, isAnimated: false)
        }
    }
    
    var ewastemap: some View {
        TabView{
            GeometryReader { proxy in
                let feature = mainfeature[2]
                FeatureItemMP(feature: feature)
                    .cornerRadius(30)
                    .modifier(OutlineModifier(cornerRadius: 30))
                    .rotation3DEffect(
                        .degrees(proxy.frame(in: .global).minX / -10),
                        axis: (x: 0, y: 1, z: 0), perspective: 1
                    )
                    .shadow(color: Color("Shadow").opacity(0.3),
                            radius: 30, x: 0, y: 30)
                    .blur(radius: abs(proxy.frame(in: .global).minX) / 40)
                    .overlay(
                        /*
                        Image(feature.image)//course.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(x: 32, y: -80)
                            .frame(height: 230)
                            .offset(x: proxy.frame(in: .global).minX / 2)
                         */
                        LottieView(filename: "mapWithPins")
                            .aspectRatio(contentMode: .fill)
                            .offset(x: 32, y: -80)
                            .frame(height: 250)
                            .offset(x: proxy.frame(in: .global).minX / 2)
                    )
                    .padding(20)
                    .onTapGesture {
                        showCourse = true
                        selectedFeature = feature
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 460)
        .sheet(isPresented: $showCourse) {
            LocationsView()
                .environmentObject(LocationsViewModel())
            //EWasteMapView(namespace: namespace, course: $selectedCourse, isAnimated: false)
        }
    }
    
    
    
    /*
    var featured: some View {
        TabView {
            ForEach(courses) { course in
                GeometryReader { proxy in
                    FeaturedItem(course: course)
                        .cornerRadius(30)
                        .modifier(OutlineModifier(cornerRadius: 30))
                        .rotation3DEffect(
                            .degrees(proxy.frame(in: .global).minX / -10),
                            axis: (x: 0, y: 1, z: 0), perspective: 1
                        )
                        .shadow(color: Color("Shadow").opacity(0.3),
                                radius: 30, x: 0, y: 30)
                        .blur(radius: abs(proxy.frame(in: .global).minX) / 40)
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .offset(x: 32, y: -80)
                                .frame(height: 230)
                                .offset(x: proxy.frame(in: .global).minX / 2)
                        )
                        .padding(20)
                        .onTapGesture {
                            showCourse = true
                            selectedCourse = course
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityAddTraits(.isButton)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 460)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
                .accessibility(hidden: true)
            
        )
        .sheet(isPresented: $showCourse) {
            CourseView(namespace: namespace, course: $selectedCourse, isAnimated: false)
        }
    }
    */
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Model())
    }
}
