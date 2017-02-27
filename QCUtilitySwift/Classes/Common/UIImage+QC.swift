//
//  UIImage+QC.swift
//  Pods
//
//  Created by Qi Chen on 2/27/17.
//
//

import Foundation
import AVFoundation

extension UIImage {
    public convenience init(sampleBuffer: CMSampleBuffer) {
        let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
        let context = CIContext(options: nil)
        let cgImage = context.createCGImage(CIImage(cvPixelBuffer: imageBuffer), from: CGRect(x: 0, y: 0, width: CGFloat(CVPixelBufferGetWidth(imageBuffer)), height: CGFloat(CVPixelBufferGetHeight(imageBuffer))))
        self.init(cgImage: cgImage!)
    }
}
