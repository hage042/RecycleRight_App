//
//  ScanABinView.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/8/22.
//

import SwiftUI

struct ScanABinView: View {
    
    var namespace: Namespace.ID
    @Binding var course: Course
    var isAnimated = true
    
    @State var viewState: CGSize = .zero
    @State var showSection = false
    @State var appear = [false, false, false]
    //@State var selectedSection = courseSections[0]
    
    @EnvironmentObject var model: Model
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                //sectionsSection
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: appear[0] ? 0 : 30))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3))
            .modifier(OutlineModifier(cornerRadius: viewState.width / 3))
            .shadow(color: Color("Shadow").opacity(0.5), radius: 30, x: 0, y: 10)
            .scaleEffect(-viewState.width/500 + 1)
            .background(Color("Shadow").opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isAnimated ? drag : nil)
            .ignoresSafeArea()
            
            Button {
                isAnimated ?
                withAnimation(.closeCard) {
                    model.showDetail = false
                    model.selectedCourse = 0
                }
                : presentationMode.wrappedValue.dismiss()
            } label: {
                CloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
            
            LogoView(image: "Badge-ARkit")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(20)
                .matchedGeometryEffect(id: "logo 1", in: namespace)
                .ignoresSafeArea()
                .accessibility(hidden: true)
        }
        .zIndex(1)
        .onAppear { fadeIn() }
        .onChange(of: model.showDetail) { show in
           fadeOut()
        }
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                /*
                
                
                
                
                
                SPACE TO ADD ARRRR
                
                
                
                */
                //Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .mask(
                RoundedRectangle(cornerRadius: appear[0] ? 0 : 30)
                    .matchedGeometryEffect(id: "mask 1", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
        }
        .frame(height: 500)
    }
    
    func close() {
        withAnimation {
            viewState = .zero
        }
        withAnimation(.closeCard.delay(0.2)) {
            model.showDetail = false
            model.selectedCourse = 0
        }
    }

    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 100 {
                    withAnimation {
                        viewState = value.translation
                    }
                }
                
                if viewState.width > 120 {
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.openCard) {
                        viewState = .zero
                    }
                }
            }
    }

    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }

    func fadeOut() {
        withAnimation(.easeIn(duration: 0.1)) {
            appear[0] = false
            appear[1] = false
            appear[2] = false
        }
    }
}
/*
struct ScanABinView_Previews: PreviewProvider {
    static var previews: some View {
        ScanABinView(namespace: namespace, course: .constant(courses[0]))
            .environmentObject(Model())
    }
}
*/
