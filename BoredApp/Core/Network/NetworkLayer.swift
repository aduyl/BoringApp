//
//  NetworkLayer.swift
//  BoredApp
//
//  Created by mac on 21.09.2021.
//

import Foundation

protocol NetworkLayerProtocol: AnyObject {
    func fetchActivity(url: String, complition: @escaping(Result<Activity, Error>) -> Void)
    
}

final class NetworkLayer: NetworkLayerProtocol {
    func fetchActivity(url: String, complition: @escaping (Result<Activity, Error>) -> Void) {
        guard let url = URL(string: url) else { return }

        let session = URLSession.shared

        session.dataTask(with: url) { data, response, eror in
            if let error = eror {
                complition(.failure(error))
            }

            if let data = data {
                do {
                    let json = try JSONDecoder().decode(Activity.self, from: data)
                    complition(.success(json))
                } catch {
                    complition(.failure(error))
                }
            }
        }.resume()
    }

}
