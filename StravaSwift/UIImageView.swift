//
//  UIImageView.swift
//  StravaSwift
//
//  Created by MATTHEW CLARKSON on 23/05/2016.
//  Copyright © 2016 Matthew Clarkson. All rights reserved.
//

import UIKit

extension UIImageView {

    func from(url url: NSURL?) {
        guard let
            url = url,
            data = NSData(contentsOfURL: url)
            else { return }
        
        self.image = UIImage(data: data)
    }
}
