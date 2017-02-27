//
//  AVCaptureConnection+QC.swift
//  Pods
//
//  Created by Qi Chen on 2/24/17.
//
//

import Foundation
import AVFoundation

extension AVCaptureConnection {
    open func configureVideoOrientation() {
        self.videoOrientation = AVCaptureVideoOrientation(rawValue: UIDevice.current.orientation.rawValue)!
    }
}
