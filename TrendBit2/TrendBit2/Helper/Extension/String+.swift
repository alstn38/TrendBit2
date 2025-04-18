//
//  String+.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import SwiftUI

extension String {
    
    func highlighting(_ keyword: String, color: Color) -> AttributedString {
        guard !keyword.isEmpty else { return AttributedString(self) }
        var attr = AttributedString(self)
        let lc = self.lowercased()
        let key = keyword.lowercased()
        var pos = lc.startIndex
        while let range = lc[pos...].range(of: key) {
            let ns = NSRange(range, in: lc)
            if let swiftRange = Range(ns, in: attr) {
                attr[swiftRange].foregroundColor = color
            }
            pos = range.upperBound
        }
        return attr
    }
}
