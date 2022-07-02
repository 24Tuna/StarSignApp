//
//  ViewModel.swift
//  StarSignApp
//
//  Created by cmStudent on 2022/06/23.
//

import Foundation
import Combine
import UIKit

final class ViewModel: ObservableObject{
    
    
    //MARK: - Outputs
    @Published private(set) var cardViewInputs: [CardView.Input] = []
    
    //エラーを表示するか
    @Published var isShowError = false
    
    //読み込みテキストを表示するか
    @Published var isLoading = false
    
    //MARK: - private
    //通信する処理が入っているService
    private let apiService: APIService
    
    //Publisherを動かす
    private let onCommitSubject = PassthroughSubject<String, Never>()
    
    //JSONを分解したものを受け取って処理する
    private let responseSubject = PassthroughSubject<SignResponce, Never>()
    //エラーが出たら動くSubject
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(apiService: APIService){
        self.apiService = apiService
        print("test")
        bind()
        onCommitSubject.send("")
    }
    
    func bind(){
        onCommitSubject
            .flatMap { query in
                self.apiService.request(with: SignRequest(query: query))
            }
            .catch { error -> Empty<SignResponce, Never> in
                self.errorSubject.send(error)
                return Empty()
            }
            .map { $0.result }
            .sink { items in
                self.cardViewInputs = self.convertInput(items: items)
                self.isLoading = false
            }
            .store(in: &cancellable)
        
        onCommitSubject
            .map{ _ in true}
            .assign(to: \.isLoading, on:self)
            .store(in: &cancellable)
        
        errorSubject
            .sink(receiveValue: { [weak self] (error) in
                guard let self = self else{ return }
                self.isShowError = true
                self.isLoading = false
            })
    }
    
    private func convertInput(items: [StarSign]) -> [CardView.Input]{
        var inputs:[CardView.Input] = []
        
        print("convert")
        
        for item in items {
            guard let url = URL(string: item.starIcon) else{
                continue
            }
            
            //画像データをネットから取得
            let data = try? Data(contentsOf: url)
            //データを画像化
            let image = UIImage(data: data ?? Data()) ?? UIImage()
            
            
//            print(item.name)
            
            inputs.append(CardView.Input(name: item.jpName, direction: item.direction, altitude: item.altitude.rawValue,starIcon: image))
        }
        return inputs
    }
    
    
}
