//
//  NumberFormatterManager.swift
//  TrendBit2
//
//  Created by 강민수 on 4/18/25.
//

import Foundation

final class NumberFormatterManager {
    
    static let shared = NumberFormatterManager()
    
    private let numberFormatter = NumberFormatter()
    private let percentNumberFormatter = NumberFormatter()
    
    private init() {
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.groupingSeparator = ","
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSize = 3
        
        percentNumberFormatter.numberStyle = .percent
        percentNumberFormatter.minimumFractionDigits = 2
    }
    
    /// TrendBit 소수점 표기 방식 String을 반환하는 메서드
    /// - 소수점 3자리에서 반올림 하여 소수점 2자리까지 표시
    /// - 정수 영역은 세 자리마다 쉼표로 구분하여 표시
    func pointNumberString(from value: Double) -> String {
        let digit: Double = pow(10, 2)
        let roundNumber = round(value * digit) / digit
        
        return numberFormatter.string(for: roundNumber) ?? "Error"
    }
    
    /// TrendBit Percent 표기 방식 String을 반환하는 메서드
    /// - 소수점 2자리까지 필수적으로 표시됩니다.
    func percentString(from value: Double) -> String {
        return percentNumberFormatter.string(for: value) ?? "Error"
    }
    
    /// TrendBit Percent 표기 방식 String을 반환하는 메서드
    /// - 소수점 2자리까지 필수적으로 표시됩니다.
    func percentDidvidHundred(from value: Double) -> String {
        let value = value / 100
        return percentNumberFormatter.string(for: value) ?? "Error"
    }
}
