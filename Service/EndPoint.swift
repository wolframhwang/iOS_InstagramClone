//
//  EndPoint.swift
//  InstagramClone
//
//  Created by 황지웅 on 2021/06/19.
//

import Foundation

struct SimpleResponse<T: Codable>: Codable {
    let statusCode: Int?
    let message: String?
    let data: T?
    enum CodingKeys: CodingKey {
        case statusCode,
             message,
             data
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = (try? values.decode(Int.self, forKey: .statusCode)) ?? nil
        message = (try? values.decode(String.self, forKey: .message)) ?? nil
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}


