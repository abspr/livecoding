//
//  NSCollectionLayoutGroup+RowsGroup.swift
//
//  Created by Hosein Abbaspour on 3/14/23.
//

import UIKit

extension NSCollectionLayoutGroup {

    static func rows(sizeCollection: [CGSize], numberOfRows: CGFloat, horizontalSpacing: CGFloat, verticalSpacing: CGFloat) -> NSCollectionLayoutGroup {
        var items: [NSCollectionLayoutGroupCustomItem] = []
        var layouts: [Int: CGFloat] = [:]

        (0 ..< Int(numberOfRows)).forEach { layouts[$0] = 0 }

        sizeCollection.forEach { size in
            let height = size.height
            let width = size.width

            let minWidth = layouts.min(by: { a, b in a.value < b.value })?.value ?? 0

            let insertingRow = layouts
                .filter { layout in layout.value == minWidth }
                .map { $0.key }
                .min() ?? 0

            let isFirstItemInRow = (layouts[insertingRow] ?? 0) == 0
            let x = (layouts[insertingRow] ?? 0.0) + (isFirstItemInRow ? 0 : horizontalSpacing)
            let y = height * CGFloat(insertingRow) + verticalSpacing * CGFloat(insertingRow)
            
            let frame = CGRect(x: x, y: y, width: width, height: height)
            
            let item = NSCollectionLayoutGroupCustomItem(frame: frame)
            items.append(item)

            layouts[insertingRow] = frame.maxX
        }
        let groupWidth = (layouts.max(by: { a, b in a.value < b.value })?.value ?? 0)
        let groupHeight = (numberOfRows * (sizeCollection.first?.height ?? 0) + ((numberOfRows - 1) * verticalSpacing))
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(groupWidth),
            heightDimension: .absolute(groupHeight)
        )
        
        let group = NSCollectionLayoutGroup.custom(layoutSize: groupSize) { _ in items }

        return group
    }
}
