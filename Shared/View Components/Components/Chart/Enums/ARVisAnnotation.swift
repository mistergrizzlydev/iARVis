//
//  ARVisAnnotation.swift
//  iARVis
//
//  Created by Junjie Chen on 2022/8/26.
//

import Charts
import SwiftUI
import Foundation

enum ARVisAnnotationPosition: String, RawRepresentable, Codable {
    case topLeading
    case topTrailing
    case bottomTrailing
    case bottomLeading
    case leading
    case trailing
}

@available(iOS 16, *)
struct ARVisAnnotation: Codable, Equatable {
    var position: ARVisAnnotationPosition
    var content: ViewElementComponent
}

@available(iOS 16, *)
extension AnnotationPosition {
    init(_ annotationPosition: ARVisAnnotationPosition) {
        switch annotationPosition {
        case .topLeading:
            self = .topLeading
        case .topTrailing:
            self = .topTrailing
        case .bottomTrailing:
            self = .bottomTrailing
        case .bottomLeading:
            self = .bottomLeading
        case .leading:
            self = .leading
        case .trailing:
            self = .trailing
        }
    }
}

@available(iOS 16, *)
extension Alignment {
    init(_ annotationPosition: ARVisAnnotationPosition) {
        switch annotationPosition {
        case .topLeading:
            self = .topLeading
        case .topTrailing:
            self = .topTrailing
        case .bottomTrailing:
            self = .bottomTrailing
        case .bottomLeading:
            self = .bottomLeading
        case .leading:
            self = .leading
        case .trailing:
            self = .trailing
        }
    }
}
