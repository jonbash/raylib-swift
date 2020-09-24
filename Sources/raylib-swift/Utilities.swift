//
//  Utilities.swift
//  raylib-swift
//
//  Created by Jon Bash on 2020-09-24.
//

import Foundation


extension Comparable {
    func clamped(min: Self, max: Self) -> Self {
        switch self {
        case ...min:
            return min
        case max...:
            return max
        default:
            return self
        }
    }

    func clamped(to range: ClosedRange<Self>) -> Self {
        self.clamped(min: range.lowerBound, max: range.upperBound)
    }

    mutating func clamp(min: Self, max: Self) {
        self = self.clamped(min: min, max: max)
    }

    mutating func clamp(to range: ClosedRange<Self>) {
        self.clamp(min: range.lowerBound, max: range.upperBound)
    }
}
