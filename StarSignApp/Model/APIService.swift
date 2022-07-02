//
//  APIService.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/23.
//

import Foundation
import Combine

protocol APIServiceType{
    func request<Request>(with request:Request) -> AnyPublisher<Request.Response, APIServiceError> where Request:APIRequestType
}

final class APIService: APIServiceType{
    private let baseURLstring: String
    
    init(baseURLString: String = "https://private-anon-6d0573fe41-hoshimiru.apiary-proxy.com"){
        self.baseURLstring = baseURLString
    }
    
    func request<SignRequest>(with request: SignRequest) -> AnyPublisher<SignRequest.Response, APIServiceError> where SignRequest: APIRequestType {
        
        print(baseURLstring)
        
            guard let pathURL = URL(string: request.path, relativeTo: URL(string: baseURLstring)) else{
                return Fail(error: APIServiceError.invaildUrl).eraseToAnyPublisher()
        }//guard let
        
        print("========")
        print(pathURL)
        print("========")
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        
        print("========")
        print(urlComponents)
        print("========")
        
        var request = URLRequest(url: urlComponents.url!)
        
        
        let decorder = JSONDecoder()
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map{ data, urlResponce in data}
        //エラーが起きた時にresponceErrorを返す
            .mapError { _ in APIServiceError.responseError }
        
        //ここからは正常に取得できたデータを処理していく
        //デコードする
            .decode(type: SignRequest.Response.self, decoder: decorder)
        //デコードでエラーが起きた時
            .mapError { error in
                print("デコードエラー")
                return APIServiceError.parseError(error)}
        //メインスレッドで実行する
            .receive(on: RunLoop.main)
        //Publisherを平坦に鳴らす
            .eraseToAnyPublisher()
    }//func request
}
