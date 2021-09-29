//
//  MainInteractor.swift
//  BoredApp
//
//  Created by mac on 23.09.2021.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    func getActivity()
    func changeRequest(requerstActivity: RequestActivity)
}

final class MainInteractor: MainInteractorProtocol {
    weak var presenter: MainPresenterProtocol!
    let network: NetworkLayerProtocol = NetworkLayer()
    var url = Constants.url
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func getActivity() {
        network.fetchActivity(url: url) {
            result in
            switch result {
            case .failure(let error):
                let code = (error as NSError).code
                self.presenter.showAlertView(with: self.allertText(errorCode: code))
                self.url = Constants.url
            case .success(let data):
                self.presenter.updateActivity(activity: data)
            }
        }
    }
    
    func changeRequest(requerstActivity: RequestActivity) {
        self.url = convertURL(requerstActivity: requerstActivity)
    }
    
}

extension MainInteractor {
    func convertURL(requerstActivity: RequestActivity) -> String {
        var url: String = "\(Constants.url)?"
        if let participants = requerstActivity.participants {
            if participants != "" {
                url = "\(url)participants=\(participants)&"
            }
        }
        if let price = requerstActivity.price {
            if price {
                url = "\(url)minprice=0.01&maxprice=1&"
            } else {
                url = "\(url)price=0.0&"
            }
        }
        if let type = requerstActivity.type {
            url = "\(url)type=\(type)&"
        }
        url.removeLast()
        return url
    }
    
    func allertText(errorCode: Int) -> String {
        if errorCode == -1009 {
            return "No Internet connection"
        }
        return "No activity found with the specified parameters"
    }
}
