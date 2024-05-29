//
//  TBCoder.swift
//  TastyBites
//
//  Created by Maxym Bilyk on 29.05.2024.
//

import Foundation

enum TBCoder {
    static let defaultDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            
            if let date = OMFormatter.serverDateFormatter.date(from: dateString) {
                return date
            } else if let date = OMFormatter.iso8601DateFormatter.date(from: dateString) {
                return date
            }
            
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
        })
//        decoder.dateDecodingStrategy = .formatted(OMFormatter.serverDateFormatter)
        return decoder
    }()
    
    static let defaultEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
//        encoder.dateEncodingStrategy = .formatted(OMFormatter.serverDateFormatter)

        encoder.dateEncodingStrategy = .custom({ date, encoder in
            var container = encoder.singleValueContainer()
            let dateString = OMFormatter.iso8601DateFormatter.string(from: date)
            try container.encode(dateString)
        })

        return encoder
    }()
    static let defaultEncoderCurrentTimezone: JSONEncoder = {
        let encoder = JSONEncoder()
//        encoder.dateEncodingStrategy = .formatted(OMFormatter.serverDateFormatter)

        encoder.dateEncodingStrategy = .custom({ date, encoder in
            var container = encoder.singleValueContainer()
            let dateString = OMFormatter.iso8601CurrentTimezoneDateFormatter.string(from: date)
            try container.encode(dateString)
        })

        return encoder
    }()

    static let snakeCaseDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
