import Foundation
import APIKit
import Himotoki

public protocol GarageRequestParameterContainer {
    var method: HTTPMethod { get }
    var path: String { get }
    var queryParameters: [String: Any]? { get }
    var bodyParameters: BodyParameters? { get }
    var headerFields: [String: String] { get }

    func intercept(urlRequest: NSMutableURLRequest) throws -> NSMutableURLRequest
}

public protocol GarageDecodeResponseOption {
    var decodeRootKeyPath: Himotoki.KeyPath? { get }
}

public extension GarageRequestParameterContainer {
    var queryParameters: [String: Any]? {
        return nil
    }

    var bodyParameters: BodyParameters? {
        return nil
    }

    var headerFields: [String: String] {
        return [:]
    }

    func intercept(urlRequest: NSMutableURLRequest) throws -> NSMutableURLRequest {
        return urlRequest
    }
}

public extension GarageDecodeResponseOption {
    var decodeRootKeyPath: Himotoki.KeyPath? {
        return nil
    }
}

public protocol GarageRequest: GarageRequestParameterContainer, GarageDecodeResponseOption {
    associatedtype Resource
}
