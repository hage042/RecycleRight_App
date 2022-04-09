//
//  FeatureItemMP.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/8/22.
//

import SwiftUI

struct FeatureItemMP: View {
    
    var feature: FeatureComp
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            Image(feature.logo)
                .resizable()
                .frame(width: 32, height: 32)
                .cornerRadius(10)
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(18)
                .modifier(OutlineOverlay(cornerRadius: 18))
            Text(feature.title)
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(feature.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.secondary)
            Text(feature.text)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .lineLimit(sizeCategory > .large ? 1 : 2)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 40)
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(.ultraThinMaterial)
        .backgroundColor(opacity: 0.5)
    }
}
/*
struct FeatureItemMP_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItemMP()
    }
}
 */
