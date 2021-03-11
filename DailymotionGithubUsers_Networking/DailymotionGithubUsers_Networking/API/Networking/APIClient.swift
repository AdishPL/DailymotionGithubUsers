//
//  APIClient.swift
//  DailymotionGithubUsers_Networking
//
//  Created by Adrian Kaczmarek on 11/03/2021.
//

import Foundation

typealias ResultCallback<Value> = (Result<Value, Error>) -> Void

protocol APIClientProtocol {
    func makeRequest<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>)
}

class APIClient: APIClientProtocol {
    let requestBuilder: RequestBuildable
    let session: URLSession
    
    lazy var jsonDecoder = JSONDecoder()
    
    init(requestBuilder: RequestBuildable,
         urlSession: URLSession = URLSession(configuration: .default)) {
        self.requestBuilder = requestBuilder
        self.session = urlSession
    }
    
    func makeRequest<T>(_ request: T, completion: @escaping ResultCallback<T.Response>) where T : APIRequest {
        var endpointRequest: URLRequest
        do { endpointRequest = try requestBuilder.endpointRequest(from: request) }
        catch { completion(.failure(error)); return }

        startDataTask(of: endpointRequest, using: request, withCompletionHandler: completion)
    }
    
    private func startDataTask<T: APIRequest>(of endpointRequest: URLRequest,
                                              using request: T,
                                              withCompletionHandler completion: @escaping ResultCallback<T.Response>) {
        session.dataTask(with: endpointRequest) { [weak self] (data, response, error) in
            guard let self = self else { return }
            let response = RequestResponse(data, response, error)
            self.process(response, from: request, withCompletionHandler: completion)
        }.resume()
    }
    
    private func process<T: APIRequest>(_ response: RequestResponse,
                                        from request: T,
                                        withCompletionHandler completion: @escaping ResultCallback<T.Response>) {

        if let responseError = check(response.urlResponse) {
            completion(.failure(responseError))
        } else if let error = response.error {
            completion(.failure(APIError.server(error: error)))
        } else {
            completion(process(response.data, from: request))
        }
    }
    
    private func process<T: APIRequest>(_ data: Data?, from: T) -> Result<T.Response, Error> {
        if let data = data {
            do {
                let apiResponse = try jsonDecoder.decode(APIResponse<T.Response>.self, from: data)
                
                switch apiResponse {
                case .error(let responseError):
                    return .failure(APIError.server(error: responseError))
                case .data(let mapped):
                    return .success(mapped)
                }
            } catch {
                return .failure(error)
            }
        } else {
            return .failure(APIError.noData)
        }
    }
}


extension APIClient {
    fileprivate func check(_ response: URLResponse?) -> HTTPError? {
        if let httpResponse = response as? HTTPURLResponse {
            if (200 ... 299 ~= httpResponse.statusCode) {
                return nil
            }
            return HTTPError(rawValue: httpResponse.statusCode)
        }
        return nil
    }
}