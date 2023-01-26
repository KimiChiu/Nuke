// The MIT License (MIT)
//
// Copyright (c) 2015-2021 Alexander Grebenyuk (github.com/kean).

import Foundation

#if (os(iOS) || os(tvOS)) && !targetEnvironment(macCatalyst)
import UIKit

public class AnimatedImageView: UIImageView, GIFAnimatable {

    /// A lazy animator.
    lazy var animator: Animator? = {
        return Animator(withDelegate: self)
    }()

    /// Layer delegate method called periodically by the layer. **Should not** be called manually.
    ///
    /// - parameter layer: The delegated layer.
    override public func display(_ layer: CALayer) {
        if UIImageView.instancesRespond(to: #selector(display(_:))) {
            super.display(layer)
        }
        updateImageIfNeeded()
    }

    public func autoPlay() {
        animator?.manuallyStopped = false;
    }

    // Start animating GIF.
    public func startAnimatingGIF() {
        animator?.manuallyStopped = false;
        animator?.startAnimating()
    }

    // Stop animating GIF.
    public func stopAnimatingGIF() {
        animator?.manuallyStopped = true;
        animator?.stopAnimating()
    }

    // update image by current frame
    public func updateDisplayIfNeeded() {
        updateImageIfNeeded();
    }

}
#endif
