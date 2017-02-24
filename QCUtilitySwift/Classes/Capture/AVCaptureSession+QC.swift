//
//  AVCaptureSession+QC.swift
//  Pods
//
//  Created by Qi Chen on 2/24/17.
//
//

import Foundation
import AVFoundation

extension AVCaptureSession {
    open class func session(withMediaType mediaType: String!) -> AVCaptureSession {
        let session = AVCaptureSession()
        do {
            if let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) {
                let deviceInput = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(deviceInput) {
                    session.addInput(deviceInput)
                }
            }
        } catch {
            print(error)
        }
        return session
    }
    
    open func configureVideoPreview(withView view: UIView!) {
        if let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: self) {
            videoPreviewLayer.frame = view.frame
            view.layer.addSublayer(videoPreviewLayer)
        }
    }
}