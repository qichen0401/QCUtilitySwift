//
//  AVCaptureStillImageOutput+QC.swift
//  Pods
//
//  Created by Qi Chen on 2/24/17.
//
//

import UIKit
import AVFoundation

extension AVCaptureStillImageOutput {
    open func captureImage(completionHandler handler: ((UIImage?, Error?) -> Swift.Void)!) {
        if let connection = self.connection(withMediaType: AVMediaTypeVideo) {
            connection.configureVideoOrientation()
            self.captureStillImageAsynchronously(from: connection, completionHandler: {
                if $1 == nil {
                    handler(UIImage(data: AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation($0)), $1)
                } else {
                    handler(nil, $1)
                }
            })
        }
    }
}
