//
//  Teste.swift
//  ProCycle
//
//  Created by sml on 24/05/23.
//

import SwiftUI

public struct PageInfo: Equatable, Codable {
    public let hasNextPage: Bool
    public let endCursor: String?
    public static let `default`: PageInfo = PageInfo(hasNextPage: true, endCursor: nil)
}

public protocol Pageable {
    associatedtype Value: Identifiable & Hashable
    func loadPage(after currentPage: PageInfo, size: Int) async throws -> (items: [Value], info: PageInfo)
}

public final class PagingViewModel<T: Pageable>: ObservableObject {
    @Published private(set) var items = [T.Value]()
    let source: T
    let pageSize: Int
    let threshold: Int
    private(set) var pageInfo: PageInfo

    init(source: T, pageInfo: PageInfo = .default, threshold: Int, pageSize: Int) {
        self.source = source
        self.pageInfo = pageInfo
        self.threshold = threshold
        self.pageSize = pageSize
    }
}
