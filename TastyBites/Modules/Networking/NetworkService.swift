//
//  NetworkService.swift
//  TastyBites
//
//  Created by Maxym Bilyk on 29.05.2024.
//

import Foundation
import Alamofire

protocol IEndpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameter: Parameters? { get }
    var header: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

struct ErrorData: Decodable {
    let error: String?
}

struct DecodeType<T: Decodable>: Decodable {
    var message: [String]?
    var msg: String?
    var data: T?
    var error: String?
    var status: Bool?
    var statusCode: Int?
    
    private enum CodingKeys: String, CodingKey {
        case
        message = "message",
        msg,
        data = "data",
        error = "error",
        status = "status",
        statusCode = "statusCode"
    }
    
    init(
        message: [String]? = nil,
        msg: String? = nil,
        data: T? = nil,
        error: String? = nil,
        status: Bool? = nil,
        statusCode: Int? = nil
    ) {
        self.message = message
        self.msg = msg
        self.data = data
        self.error = error
        self.status = status
        self.statusCode = statusCode
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            do {
                status = try container.decode(Bool.self, forKey: .status)
            } catch DecodingError.keyNotFound {
                status = nil
            }
            statusCode = nil
            message = nil
        }
        
        if status ?? false {
            error = nil
            do {
                data = try container.decode(T.self, forKey: .data)
            } catch(let error) {
                print("===> error", error)
                data = nil
            }
        } else {
            data = nil
            do {
                do {
                    let dataAux = try container.decode(String.self, forKey: .data)
                    error = dataAux
                } catch DecodingError.valueNotFound {
                    let dataAux = try container.decode(String.self, forKey: .msg)
                    error = dataAux
                } catch(let error) {
                    print("===> error no data", error)
                }
                
                do {
                    message = try container.decode([String].self, forKey: .message)
                } catch DecodingError.typeMismatch {
                    message = [try container.decode(String.self, forKey: .message)]
                }
                catch DecodingError.keyNotFound {
                    guard let error = error else {
                        message = nil
                        return
                    }
                    message = error.isEmpty ? nil : [error]
                }
            }
            print("===> error", error, message)
        }
    }
}

class NetworkService {
    static let shared = NetworkService()
    private var dataRequest: DataRequest?
    
    private let baseUrl = EnvManager.shared.envType.backEndUrl
    private let basePlainUrl = EnvManager.shared.envType.backEndUrl
    
    @discardableResult
    private func _dataRequest(
        url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = ["Content-Type":"application/json"])
    -> DataRequest {
        return Alamofire.Session.default.request(
            url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        )
    }
    
    func request<T: IEndpoint, D: Codable>(endpoint: T, decodeType: D.Type, shouldDecodeUsed: Bool = false, isPlainUrl: Bool = false, completion: @escaping (Swift.Result<D?, ErrorModel>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let url = (isPlainUrl ? self.basePlainUrl : self.baseUrl) + endpoint.path
            print("===> body", url, endpoint.parameter, endpoint.method)
            self.dataRequest = self._dataRequest(url: url,
                                                 method: endpoint.method,
                                                 parameters: endpoint.parameter,
                                                 encoding: endpoint.encoding,
                                                 headers: endpoint.header)
            self.dataRequest?.validate()
            
            self.dataRequest?.responseDecodable(of: DecodeType<D>.self, decoder: TBCoder.defaultDecoder) { (response) in
                if let data = response.data {
                    print(String(data: data, encoding: .utf8))
                    // TODO: Remove
                    if shouldDecodeUsed {
                            switch response.result {
                            case .success(let value):
                                let decoder = JSONDecoder()
                                if let decodedRes = try? decoder.decode(D.self, from: data) {
                                 
                                        print("===> done", endpoint.path)
                                        completion(.success(decodedRes))
                
                                } else {
                                  
                                    completion(.failure(ErrorModel.request))
                                }
                            case .failure(let error):
                                print("===> error", endpoint.path, error)
                                completion(.failure(ErrorModel.server(description: error.errorDescription ?? "no")))
                           
                           
                        }
                        return
                    }
                }
                    
                    switch response.result {
                    case .success(let value):
                        
                        if let error = value.error {
                            print("===> error", endpoint.path, error)
                            completion(.failure(ErrorModel.server(description: error)))
                        } else {
                            print("===> done", endpoint.path)
                            completion(.success(value.data))
                        }
                        
                    case .failure(let error):
                        print("===> error", endpoint.path, error)
                        completion(.failure(ErrorModel.server(description: error.errorDescription ?? "no")))
                    }
                
            }
        }
    }
}
