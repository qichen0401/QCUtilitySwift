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
    open class func videoSession() -> AVCaptureSession {
        let session = AVCaptureSession()
        do {
            if let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) {
                let deviceInput = try AVCaptureDeviceInput(device: device)
                session.checkAndAddInput(input: deviceInput)
            }
        } catch {
            print(error)
        }
        return session
    }
    
    open func configureVideoPreview(withView view: UIView!) {
        if let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: self) {
            videoPreviewLayer.frame = view.bounds
            view.layer.addSublayer(videoPreviewLayer)
        }
    }
    
    open func checkAndAddInput(input: AVCaptureInput) {
        if self.canAddInput(input) {
            self.addInput(input)
        }
    }
    
    open func checkAndAddOutput(output: AVCaptureOutput) {
        if self.canAddOutput(output) {
            self.addOutput(output)
        }
    }
    
    open func switchToCamera(withPosition position: AVCaptureDevicePosition) {
        for input in self.inputs {
            self.removeInput(input as! AVCaptureInput)
        }
        
        let devices = AVCaptureDevice.devices(withMediaType: AVMediaTypeVideo) as! [AVCaptureDevice]
        
        for device in devices {
            if device.position == position {
                do {
                    let deviceInput = try AVCaptureDeviceInput(device: device)
                    self.checkAndAddInput(input: deviceInput)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    open func cameraPosition() -> AVCaptureDevicePosition {
        let input = self.inputs.first as! AVCaptureDeviceInput
        return input.device.position
    }
    
    open func switchCamera() {
        self.switchToCamera(withPosition: (self.cameraPosition() == .back) ? .front : .back)
    }
    
}
