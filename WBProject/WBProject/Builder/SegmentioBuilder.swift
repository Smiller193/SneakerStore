//
//  SegmentioBuilder.swift
//  WBProject
//
//  Created by Shawn Miller on 4/6/19.
//  Copyright © 2019 Shawn Miller. All rights reserved.
//

import Foundation
import Segmentio
import UIKit

struct SegmentioBuilder {
    static func buildSegmentioView(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 4)) {
        segmentioView.setup(
            content: segmentioContent(),
            style: segmentioStyle,
            options: segmentioOptions(segmentioStyle: segmentioStyle, segmentioPosition: segmentioPosition)
        )
    }
    
    
    
    private static func segmentioOptions(segmentioStyle: SegmentioStyle, segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 3)) -> SegmentioOptions {
        var imageContentMode = UIView.ContentMode.center
        switch segmentioStyle {
        case .imageBeforeLabel, .imageAfterLabel:
            imageContentMode = .scaleAspectFit
        default:
            break
        }
        
        return SegmentioOptions(
            backgroundColor: .white,
            segmentPosition: segmentioPosition,
            scrollEnabled: true,
            indicatorOptions: segmentioIndicatorOptions(),
            horizontalSeparatorOptions: nil,
            verticalSeparatorOptions: nil,
            imageContentMode: imageContentMode,
            labelTextAlignment: .center,
            labelTextNumberOfLines: 1,
            segmentStates: segmentioStates(),
            animationDuration: 0.3
        )
    }
    
    
    private static func segmentioStates() -> SegmentioStates {
        return SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: .white,
                titleFont: UIFont(name: "NoirPro-Light", size: UIFont.systemFontSize) ?? UIFont.boldSystemFont(ofSize: UIFont.smallSystemFontSize),
                titleTextColor: .lightGray
            ),
            selectedState: SegmentioState(
                backgroundColor: .white,
                titleFont: UIFont(name: "NoirPro-Regular", size: UIFont.systemFontSize) ?? UIFont.boldSystemFont(ofSize: UIFont.smallSystemFontSize),
                titleTextColor: .black
            ),
            highlightedState: SegmentioState(
                backgroundColor: UIColor.lightGray.withAlphaComponent(0.6),
                titleFont: UIFont(name: "NoirPro-Light", size: UIFont.systemFontSize) ?? UIFont.boldSystemFont(ofSize: UIFont.smallSystemFontSize),
                titleTextColor: .black
            )
        )
    }
    
    
    private static func segmentioIndicatorOptions() -> SegmentioIndicatorOptions {
        return SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 1,
            height: 3.5,
            color: .black
        )
    }
    
    
    
    private static func segmentioContent() -> [SegmentioItem] {
        return [
            SegmentioItem(title: "Nike", image: nil),
            SegmentioItem(title: "Adidas", image: nil),
            SegmentioItem(title: "Air Jordan", image: nil),
            SegmentioItem(title: "Vans", image: nil)
        ]
    }
}
