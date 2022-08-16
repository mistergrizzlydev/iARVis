//
//  ChartView+GetElement.swift
//  iARVis
//
//  Created by Junjie Chen on 2022/8/15.
//

import Charts
import Foundation
import SwiftUI
import SwiftyJSON

func getElementInRangeX(proxy: ChartProxy, location: CGPoint, geo: GeometryProxy, chartData: ChartData, xStartField: String, xEndField: String) -> JSON? {
    let relativeX = location.x - geo[proxy.plotAreaFrame].origin.x
    // Int, Double, Date, String(only equal)
    if chartData.data[xStartField].array?[safe: 0]?.int != nil {
        if let intValue: Int = proxy.value(atX: relativeX) {
            for i in 0 ..< chartData.length {
                if let xStartInt = chartData.data[xStartField].array?[safe: i]?.int,
                   let xEndInt = chartData.data[xEndField].array?[safe: i]?.int,
                   intValue >= xStartInt, intValue <= xEndInt
                {
                    var dict: [String: JSON] = [:]
                    for title in chartData.titles {
                        dict[title] = chartData.data[title].array?[safe: i]
                    }
                    return JSON(dict)
                }
            }
        }
    } else if chartData.data[xStartField].array?[safe: 0]?.double != nil {
        if let doubleValue: Double = proxy.value(atX: relativeX) {
            for i in 0 ..< chartData.length {
                if let xStartDouble = chartData.data[xStartField].array?[safe: i]?.double,
                   let xEndDouble = chartData.data[xEndField].array?[safe: i]?.double,
                   doubleValue >= xStartDouble, doubleValue <= xEndDouble
                {
                    var dict: [String: JSON] = [:]
                    for title in chartData.titles {
                        dict[title] = chartData.data[title].array?[safe: i]
                    }
                    return JSON(dict)
                }
            }
        }
    } else if chartData.data[xStartField].array?[safe: 0]?.date != nil {
        if let dateValue: Date = proxy.value(atX: relativeX) {
            for i in 0 ..< chartData.length {
                if let xStartDate = chartData.data[xStartField].array?[safe: i]?.date,
                   let xEndDate = chartData.data[xEndField].array?[safe: i]?.date,
                   dateValue >= xStartDate, dateValue <= xEndDate
                {
                    var dict: [String: JSON] = [:]
                    for title in chartData.titles {
                        dict[title] = chartData.data[title].array?[safe: i]
                    }
                    return JSON(dict)
                }
            }
        }
    } else if chartData.data[xStartField].array?[safe: 0]?.string != nil {
        if let stringValue: String = proxy.value(atX: relativeX) {
            for i in 0 ..< chartData.length {
                if stringValue == chartData.data[xStartField].array?[safe: i]?.string,
                   stringValue == chartData.data[xEndField].array?[safe: i]?.string
                {
                    var dict: [String: JSON] = [:]
                    for title in chartData.titles {
                        dict[title] = chartData.data[title].array?[safe: i]
                    }
                    return JSON(dict)
                }
            }
        }
    }
    return nil
}

func getElementInRangeY(proxy: ChartProxy, location: CGPoint, geo: GeometryProxy, chartData: ChartData, yStartField: String, yEndField: String) -> JSON? {
    let relativeY = location.y - geo[proxy.plotAreaFrame].origin.y
    // Int, Double, Date, String(only equal)
    if chartData.data[yStartField].array?[safe: 0]?.int != nil {
        if let intValue: Int = proxy.value(atY: relativeY) {
            for i in 0 ..< chartData.length {
                if let yStartInt = chartData.data[yStartField].array?[safe: i]?.int,
                   let yEndInt = chartData.data[yEndField].array?[safe: i]?.int,
                   intValue >= yStartInt, intValue <= yEndInt
                {
                    var dict: [String: JSON] = [:]
                    for title in chartData.titles {
                        dict[title] = chartData.data[title].array?[safe: i]
                    }
                    return JSON(dict)
                }
            }
        }
    } else if chartData.data[yStartField].array?[safe: 0]?.double != nil {
        if let doubleValue: Double = proxy.value(atY: relativeY) {
            for i in 0 ..< chartData.length {
                if let yStartDouble = chartData.data[yStartField].array?[safe: i]?.double,
                   let yEndDouble = chartData.data[yEndField].array?[safe: i]?.double,
                   doubleValue >= yStartDouble, doubleValue <= yEndDouble
                {
                    var dict: [String: JSON] = [:]
                    for title in chartData.titles {
                        dict[title] = chartData.data[title].array?[safe: i]
                    }
                    return JSON(dict)
                }
            }
        }
    } else if chartData.data[yStartField].array?[safe: 0]?.date != nil {
        if let dateValue: Date = proxy.value(atY: relativeY) {
            for i in 0 ..< chartData.length {
                if let yStartDate = chartData.data[yStartField].array?[safe: i]?.date,
                   let yEndDate = chartData.data[yEndField].array?[safe: i]?.date,
                   dateValue >= yStartDate, dateValue <= yEndDate
                {
                    var dict: [String: JSON] = [:]
                    for title in chartData.titles {
                        dict[title] = chartData.data[title].array?[safe: i]
                    }
                    return JSON(dict)
                }
            }
        }
    } else if chartData.data[yStartField].array?[safe: 0]?.string != nil {
        if let stringValue: String = proxy.value(atY: relativeY) {
            for i in 0 ..< chartData.length {
                if stringValue == chartData.data[yStartField].array?[safe: i]?.string,
                   stringValue == chartData.data[yEndField].array?[safe: i]?.string
                {
                    var dict: [String: JSON] = [:]
                    for title in chartData.titles {
                        dict[title] = chartData.data[title].array?[safe: i]
                    }
                    return JSON(dict)
                }
            }
        }
    }
    return nil
}

func getElementInXY(proxy: ChartProxy, location: CGPoint, geo: GeometryProxy, chartData: ChartData, xField: String, yField: String) -> JSON? {
    let relativeX = location.x - geo[proxy.plotAreaFrame].origin.x
    let relativeY = location.y - geo[proxy.plotAreaFrame].origin.y
    // Int, Int; Int, Double; Int, Date; Int, String;
    // Double, Int; Double, Double; Double, Date; Double, String;
    // Date, Int; Date, Double; Date, Date; Date, String;
    // String, Int; String, Double; String, Date; String, String;
    if chartData.data[xField].array?[safe: 0]?.int != nil {
        if chartData.data[yField].array?[safe: 0]?.int != nil {
            if let (xIntValue, yIntValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Int, Int).self) {
                for i in 0 ..< chartData.length {
                    if xIntValue == chartData.data[xField].array?[safe: i]?.int,
                       yIntValue == chartData.data[yField].array?[safe: i]?.int
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.double != nil {
            if let (xIntValue, yDoubleValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Int, Double).self) {
                for i in 0 ..< chartData.length {
                    if xIntValue == chartData.data[xField].array?[safe: i]?.int,
                       yDoubleValue == chartData.data[yField].array?[safe: i]?.double
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.date != nil {
            if let (xIntValue, yDateValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Int, Date).self) {
                for i in 0 ..< chartData.length {
                    if xIntValue == chartData.data[xField].array?[safe: i]?.int,
                       yDateValue == chartData.data[yField].array?[safe: i]?.date
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.string != nil {
            if let (xIntValue, yStringValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Int, String).self) {
                for i in 0 ..< chartData.length {
                    if xIntValue == chartData.data[xField].array?[safe: i]?.int,
                       yStringValue == chartData.data[yField].array?[safe: i]?.string
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        }
    } else if chartData.data[xField].array?[safe: 0]?.double != nil {
        if chartData.data[yField].array?[safe: 0]?.int != nil {
            if let (xDoubleValue, yIntValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Double, Int).self) {
                for i in 0 ..< chartData.length {
                    if xDoubleValue == chartData.data[xField].array?[safe: i]?.double,
                       yIntValue == chartData.data[yField].array?[safe: i]?.int
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.double != nil {
            if let (xDoubleValue, yDoubleValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Double, Double).self) {
                for i in 0 ..< chartData.length {
                    if xDoubleValue == chartData.data[xField].array?[safe: i]?.double,
                       yDoubleValue == chartData.data[yField].array?[safe: i]?.double
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.date != nil {
            if let (xDoubleValue, yDateValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Double, Date).self) {
                for i in 0 ..< chartData.length {
                    if xDoubleValue == chartData.data[xField].array?[safe: i]?.double,
                       yDateValue == chartData.data[yField].array?[safe: i]?.date
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.string != nil {
            if let (xDoubleValue, yStringValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Double, String).self) {
                for i in 0 ..< chartData.length {
                    if xDoubleValue == chartData.data[xField].array?[safe: i]?.double,
                       yStringValue == chartData.data[yField].array?[safe: i]?.string
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        }
    } else if chartData.data[xField].array?[safe: 0]?.date != nil {
        if chartData.data[yField].array?[safe: 0]?.int != nil {
            if let (xDateValue, yIntValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Date, Int).self) {
                for i in 0 ..< chartData.length {
                    if xDateValue == chartData.data[xField].array?[safe: i]?.date,
                       yIntValue == chartData.data[yField].array?[safe: i]?.int
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.double != nil {
            if let (xDateValue, yDoubleValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Date, Double).self) {
                for i in 0 ..< chartData.length {
                    if xDateValue == chartData.data[xField].array?[safe: i]?.date,
                       yDoubleValue == chartData.data[yField].array?[safe: i]?.double
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.date != nil {
            if let (xDateValue, yDateValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Date, Date).self) {
                for i in 0 ..< chartData.length {
                    if xDateValue == chartData.data[xField].array?[safe: i]?.date,
                       yDateValue == chartData.data[yField].array?[safe: i]?.date
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.string != nil {
            if let (xDateValue, yStringValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (Date, String).self) {
                for i in 0 ..< chartData.length {
                    if xDateValue == chartData.data[xField].array?[safe: i]?.date,
                       yStringValue == chartData.data[yField].array?[safe: i]?.string
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        }
    } else if chartData.data[xField].array?[safe: 0]?.string != nil {
        if chartData.data[yField].array?[safe: 0]?.int != nil {
            if let (xStringValue, yIntValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (String, Int).self) {
                for i in 0 ..< chartData.length {
                    if xStringValue == chartData.data[xField].array?[safe: i]?.string,
                       yIntValue == chartData.data[yField].array?[safe: i]?.int
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.double != nil {
            if let (xStringValue, yDoubleValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (String, Double).self) {
                for i in 0 ..< chartData.length {
                    if xStringValue == chartData.data[xField].array?[safe: i]?.string,
                       yDoubleValue == chartData.data[yField].array?[safe: i]?.double
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.date != nil {
            if let (xStringValue, yDateValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (String, Date).self) {
                for i in 0 ..< chartData.length {
                    if xStringValue == chartData.data[xField].array?[safe: i]?.string,
                       yDateValue == chartData.data[yField].array?[safe: i]?.date
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        } else if chartData.data[yField].array?[safe: 0]?.string != nil {
            if let (xStringValue, yStringValue) = proxy.value(at: CGPoint(x: relativeX, y: relativeY), as: (String, String).self) {
                for i in 0 ..< chartData.length {
                    if xStringValue == chartData.data[xField].array?[safe: i]?.string,
                       yStringValue == chartData.data[yField].array?[safe: i]?.string
                    {
                        var dict: [String: JSON] = [:]
                        for title in chartData.titles {
                            dict[title] = chartData.data[title].array?[safe: i]
                        }
                        return JSON(dict)
                    }
                }
            }
        }
    }

    return nil
}