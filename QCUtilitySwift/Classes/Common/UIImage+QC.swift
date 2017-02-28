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
    
    public func write(to url: URL) {
        do {
            try UIImagePNGRepresentation(self)?.write(to: url)
            let userDefaults = UserDefaults.standard
            userDefaults.set(self.imageOrientation.rawValue, forKey: "UIImage+QC_imageOrientation_\(url.absoluteString)")
            userDefaults.synchronize()
        } catch {
            print(error)
        }
        
    }
    
    public class func load(from url: URL) -> UIImage? {
        do {
            let data = try Data(contentsOf: url)
            let userDefaults = UserDefaults.standard
            return UIImage(cgImage: UIImage(data: data)!.cgImage!, scale: 1.0, orientation: UIImageOrientation(rawValue: userDefaults.integer(forKey: "UIImage+QC_imageOrientation_\(url.absoluteString)"))!)
        } catch {
            print(error)
        }
        return nil
    }
    
}
