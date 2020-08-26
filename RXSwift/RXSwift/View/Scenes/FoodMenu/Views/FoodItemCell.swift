//
//  FoodItemCell.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import UIKit

class FoodItemCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    private struct Constants {
        static let maxHeight: CGFloat = 400
    }

    private static let sizingCell = UINib(nibName: String(describing: FoodItemCell.self), bundle: nil)
        .instantiate(withOwner: nil, options: nil).first! as! FoodItemCell

    static func height(forWidth width: CGFloat) -> CGFloat {
        sizingCell.prepareForReuse()
        sizingCell.layoutIfNeeded()

        var fittingSize = UIView.layoutFittingCompressedSize
        fittingSize.width = width
        let size = sizingCell.contentView.systemLayoutSizeFitting(fittingSize,
                                                                  withHorizontalFittingPriority: .required,
                                                                  verticalFittingPriority: .defaultLow)

        guard size.height < Constants.maxHeight else {
            return Constants.maxHeight
        }

        return size.height
    }
}
