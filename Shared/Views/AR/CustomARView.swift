//
//  CustomARView.swift
//  RecycleRight
//
//  Created by Danny Hagenlocker on 4/17/22.
//
import SwiftUI
import RealityKit
import ARKit
import FocusEntity

class CustomARView: ARView {
    var focusEntity: FocusEntity?
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
        focusEntity = FocusEntity(on: self, style: .classic(color: UIColor.white))//(on: self, focus: .classic)
        configure()
    }
    
    @MainActor @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        session.run(config)
    }
}
