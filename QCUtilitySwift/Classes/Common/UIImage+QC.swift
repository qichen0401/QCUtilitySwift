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
    
    public func redraw() -> UIImage {
        UIGraphicsBeginImageContext(size)
        self.draw(at: .zero)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    public func write(to url: URL) {
        do {
            let image = self.redraw()
            
            try UIImagePNGRepresentation(image)?.write(to: url)
        } catch {
            print(error)
        }
        
    }
    
    public class func load(from url: URL) -> UIImage? {
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        } catch {
            print(error)
        }
        return nil
    }
    
    public class func image(withQRCodeInputMessage inputMessage: String, size: CGSize) -> UIImage {
        let inputMessageData = inputMessage.data(using: String.Encoding.utf8)!
        let filter = CIFilter(name: "CIQRCodeGenerator", withInputParameters: ["inputMessage" : inputMessageData])!
        let outputImage = filter.outputImage!
        return UIImage(ciImage: outputImage).scale(to: size, interpolationQuality: .none)
    }
    
    public func scale(to size: CGSize) -> UIImage {
        return self.scale(to: size, interpolationQuality: .default)
    }
    
    public func scale(to size: CGSize, interpolationQuality quality: CGInterpolationQuality) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        UIGraphicsGetCurrentContext()!.interpolationQuality = quality
        self.draw(in: CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    
}
