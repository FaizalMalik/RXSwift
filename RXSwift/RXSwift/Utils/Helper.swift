//
//  Helper.swift
//  RxSwift
//
//  Created by Faizal on 06/01/1442 AH.
//  Copyright © 1442 Faizal. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
@nonobjc class var baseColor: UIColor {
  return UIColor(red: 99 / 255.0, green: 144 / 255.0, blue: 85 / 255.0, alpha: 1)
}
    @nonobjc class var fadeBaseColor: UIColor {
        return UIColor(red: 99 / 255.0, green: 144 / 255.0, blue: 85 / 255.0, alpha: 0.3)
    }
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
