//
//  APIServiceError.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/23.
//

import Foundation

enum APIServiceError: Error{
    //URLが不正な場合
    case invaildUrl
    //APIレスポンスのエラー
    case responseError
    //パースが失敗した場合
    case parseError(Error)
}
