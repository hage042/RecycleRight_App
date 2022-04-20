//
//  CameraViewDelegate.swift
//  RecycleRight
//
//  Created by Victoria Hagenlocker on 4/17/22.
//

import Foundation

public protocol CameraViewDelegate {
    func cameraAccessGranted()
    func cameraAccessDenied()
    func noCameraDetected()
    func cameraSessionStarted()
}
