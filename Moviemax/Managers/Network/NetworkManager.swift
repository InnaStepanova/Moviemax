//
//  NetworkManager.swift
//  Moviemax
//
//  Created by Николай Игнатов on 11.04.2023.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.apiKey)&language=en-US") else { return }
        
        getAndDecodeData(url: url, completion: completion)
    }
    
    func getMovieDetail(id: Int, completion: @escaping (Result<MovieDetailData, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/\(id)?api_key=\(Constants.apiKey)&language=en-US") else { return }
        
        getAndDecodeDetailData(url: url, completion: completion)
    }
    
    func getPopularTV(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/tv/popular?api_key=\(Constants.apiKey)&language=en-US") else { return }
        
        getAndDecodeData(url: url, completion: completion)
    }
    
    func getTVDetail(id: Int, completion: @escaping (Result<MovieDetailData, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/tv/\(id)?api_key=\(Constants.apiKey)&language=en-US") else { return }
        
        getAndDecodeDetailData(url: url, completion: completion)
    }
    
    func getSearchResults(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/search/multi?api_key=\(Constants.apiKey)&language=en-US&query=\(query)") else { return }
                        
        getAndDecodeData(url: url, completion: completion)
    }
    
    func getMovieCast(id: Int, completion: @escaping (Result<[Crew], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/\(id)/credits?api_key=\(Constants.apiKey)&language=en-US") else { return }
                        
        getAndDecodeDataCast(url: url, completion: completion)
    }
    
    func getTVCast(id: Int, completion: @escaping (Result<[Crew], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/tv/\(id)/credits?api_key=\(Constants.apiKey)&language=en-US") else { return }
                        
        getAndDecodeDataCast(url: url, completion: completion)
    }
    
    func downloadImage(path pathString: String, completion: @escaping (UIImage?) -> Void) {
        let baseURL = "https://image.tmdb.org/t/p/w500"
        guard let url = URL(string: "\(baseURL + pathString)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
    private func getAndDecodeData(url: URL, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let _ = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let results = try JSONDecoder().decode(NetworkMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(ApiError.failedToGetData))
            }
        } .resume()
    }
    
    private func getAndDecodeDetailData(url: URL, completion: @escaping (Result<MovieDetailData, Error>) -> Void) {
        let _ = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode(MovieDetailData.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(ApiError.failedToGetData))
            }
        } .resume()
    }
    
    private func getAndDecodeDataCast(url: URL, completion: @escaping (Result<[Crew], Error>) -> Void) {
        let _ = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let results = try JSONDecoder().decode(MovieCrew.self, from: data)
                completion(.success(results.crew ?? []))
            } catch {
                completion(.failure(ApiError.failedToGetData))
            }
        } .resume()
    }
}

struct Constants {
    static let apiKey = "697d439ac993538da4e3e60b54e762cd"
    static let baseURL = "https://api.themoviedb.org"
}

enum ApiError: Error {
    case failedToGetData
}
