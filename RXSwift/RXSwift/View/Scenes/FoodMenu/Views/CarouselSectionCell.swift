//
//  CarouselSection.swift
//  RxSwift
//
//  Created by Faizal on 02/06/1441 AH.
//  Copyright © 1441 Faizal. All rights reserved.
//

import UIKit

final class CarouselSectionCell: UITableViewCell {
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.estimatedItemSize = CGSize(width: 140, height: 235)
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            return layout
        }()

        collectionView.register(UINib(nibName: String(describing: FoodItemCell.self), bundle: nil),
                                forCellWithReuseIdentifier: String(describing: FoodItemCell.self))
        collectionView.collectionViewLayout = layout
        collectionViewHeightConstraint.constant = FoodItemCell.height(forWidth: 140)
        collectionViewHeightConstraint.isActive = true
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

extension CarouselSectionCell {
    var collectionViewOffset: CGFloat {
        get { return collectionView.contentOffset.x }
        set { collectionView.contentOffset.x = newValue }
    }

    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated: false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
    }
}
