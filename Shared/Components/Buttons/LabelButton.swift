//
//  LabelButton.swift
//  RecycleRight
//
//  Created by Victoria Hagenlocker on 4/17/22.
//
import SwiftUI

struct LabelButton: View {
    var title = ""
    
    var body: some View {
        Text(title)
            .fontWeight(.semibold)
            .font(.system(size: 25))
            .frame(maxWidth: .infinity, maxHeight: 70)
            .background(
                ZStack {
                    angularGradient
                    LinearGradient(gradient: Gradient(colors: [Color(.systemBackground).opacity(1), Color(.systemBackground).opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                        .cornerRadius(20)
                        .blendMode(.softLight)
                }
            )
            .frame(width: 250, height: 80)
            .accentColor(.primary.opacity(0.8))
//            .background(angularGradient)
//            .gesture(
//                LongPressGesture(minimumDuration: 0.5)
//                    .updating($isDetectingLongPress, body: { currentState, gestureState, transaction in
//                        gestureState = currentState
//                        transaction.animation = .spring(response: 0.5, dampingFraction: 0.5)
//                    })
//                    .onEnded({ finished in
//                        completedLongPress = finished
//                    })
//            )
//            .simultaneousGesture(
//                TapGesture().onEnded({ value in
//                    completedLongPress = true
//                })
//            )
    }
    
    var angularGradient: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.clear)
            .overlay(AngularGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 0.06691677062, green: 0.8025038449, blue: 1, alpha: 1)), location: 0.0),
                    .init(color: Color(#colorLiteral(red: 0.07352478098, green: 0, blue: 1, alpha: 1)), location: 0.4),
                    .init(color: Color(#colorLiteral(red: 0.1031964356, green: 0.9858953676, blue: 0.5572818908, alpha: 1)), location: 0.5),
                    .init(color: Color(#colorLiteral(red: 0.0749328509, green: 0.6635031104, blue: 0.3729063272, alpha: 1)), location: 0.8)]),
                center: .center
            ))
            .padding(6)
            .blur(radius: 30)
    }
}

struct LabelButton_Previews: PreviewProvider {
    static var previews: some View {
        LabelButton()
    }
}
