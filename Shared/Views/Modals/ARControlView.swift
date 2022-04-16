//
//  ARControlView.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/10/22.
//

import SwiftUI

struct ARControlView: View {
    var body: some View {
        VStack {
            Spacer()
            ControlButtonBar()
        }
    }
}


struct ControlButtonBar: View {
    var body: some View {
        HStack {
            Spacer()
            AngularButton(title: "Toggle")
            Spacer()
            AngularButton(title: "Shit")
            Spacer()
        }
    }
}



struct ARControlView_Previews: PreviewProvider {
    static var previews: some View {
        ARControlView()
    }
}
