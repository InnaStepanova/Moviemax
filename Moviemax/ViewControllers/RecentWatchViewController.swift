//
//  RecentWatchViewController.swift
//  Moviemax
//
//  Created by Лаванда on 08.04.2023.
//

import UIKit

final class RecentWatchViewController: UIViewController, UICollectionViewDelegate {
    
    private var movie = StorageManader.shared.getCurrentUser()!.recentMovies
    
    
    private lazy var recentWatchLabel: UILabel = {
        let label = UILabel()
        label.text = "Recent Watch"
        label.font = Resources.Fonts.plusJakartaSansBold(with: 18)
        return label
    }()
    
    private lazy var categoryView = CategoryCollectionView()
    
    private lazy var moviesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width, height: 160)
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .scrollableAxes
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MovieLargeCell.self, forCellWithReuseIdentifier: "MovieLargeCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(named: "BackgroundScreenColor")
        let recentVath = StorageManader.shared.getCurrentUser()?.recentMovies
        print("It is \(recentVath)")
        addViews()
        setConstraints()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movie = StorageManader.shared.getCurrentUser()!.recentMovies
        moviesCollection.reloadData()
    }
    
    private func fetchData() {
        NetworkManager.shared.getPopularMovies { [weak self] result in
            switch result {
            case .success(let movies):
                var movieIDsArray = [Int]()
                let ids = movies.map { $0.id }
                movieIDsArray.append(contentsOf: ids)
//                print(movieIDsArray)
                
                for id in movieIDsArray {
                    self?.fetchMovieDetail(movieID: id)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchMovieDetail(movieID: Int) {
        NetworkManager.shared.getMovieDetail(id: movieID) { [weak self] result in
            switch result {
            case .success(let movieDetail):
                self?.createMovieViewModels(movie: movieDetail)
                DispatchQueue.main.async {
                    self?.moviesCollection.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func createMovieViewModels(movie: MovieDetailData) {
        guard let movieID = movie.id else { return }
        
        func fetchCrew(completion: @escaping ([Crew]) -> Void) {
            NetworkManager.shared.getMovieCast(id: movieID) { result in
                switch result {
                case .success(let crew):
                    completion(crew)
                case .failure(let error):
                    print(error)
                    completion([])
                }
            }
        }
        
        var movieViewModel = MovieViewModel(
            id: movieID,
            posterURL: movie.posterPath ?? "",
            title: movie.originalTitle ?? "",
            runtime: "\(movie.runtime ?? 0) Minutes",
            reliseDate: movie.releaseDate ?? "",
            genre: movie.genres?.first?.name ?? "",
            overview: movie.overview ?? "",
            voteAverage: movie.voteAverage ?? 0.0,
            crew: nil)
        
        
        fetchCrew { [weak self] crew in
            movieViewModel.crew = crew
            DispatchQueue.main.async {
//                self?.movieViewModels.append(movieViewModel)
//                print(self?.movieViewModels)
            }
        }
    }
    
    private func addViews() {
        view.addSubview(recentWatchLabel)
        view.addSubview(categoryView)
        view.addSubview(moviesCollection)
    }
    
    private func setConstraints() {
        recentWatchLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        moviesCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recentWatchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recentWatchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            
            categoryView.topAnchor.constraint(equalTo: recentWatchLabel.bottomAnchor, constant: 24),
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            categoryView.heightAnchor.constraint(equalToConstant: 34),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            moviesCollection.topAnchor.constraint(equalTo: categoryView.bottomAnchor, constant: 24),
            moviesCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension RecentWatchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieLargeCell", for: indexPath) as! MovieLargeCell
        let model = movie[indexPath.row]
        cell.set(movie: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = movie[indexPath.row]
        let movieDetailVC = MovieDetail()
//        movieDetailVC.movie =
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

