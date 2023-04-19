//
//  SearchViewController.swift
//  Moviemax
//
//  Created by Лаванда on 06.04.2023.
//

import UIKit

final class SearchViewController: UIViewController, UICollectionViewDelegate {
    
    private var movieViewModels = [MovieViewModel]()
    
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.font = Resources.Fonts.plusJakartaSansBold(with: 18)
        return label
    }()
    
    private lazy var searchView = SearchView()
    
    private lazy var categoryView = CategoryCollectionView()
    
    lazy var moviesCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width, height: 160)
        layout.minimumLineSpacing = 24
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(named: "BackgroundScreenColor")
        collectionView.contentInsetAdjustmentBehavior = .scrollableAxes
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MovieLargeCell.self, forCellWithReuseIdentifier: "MovieLargeCell")
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(named: "BackgroundScreenColor")
        setupGradient()
        addViews()
        setConstraints()
        fetchData()
        
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
                self?.movieViewModels.append(movieViewModel)
                print(self?.movieViewModels)
            }
        }
    }
    
    private func addViews() {
        view.addSubview(searchLabel)
        view.addSubview(searchView)
        view.addSubview(categoryView)
        view.addSubview(moviesCollection)
    }
    func setupGradient() {
        let colorTop = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        let colorBot = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [colorTop, colorBot]
        gradientLayer.locations = [0.5, 1]
        view.layer.addSublayer(gradientLayer)
    }
    private func setConstraints() {
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        searchView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        moviesCollection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            
            searchView.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 35),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            searchView.heightAnchor.constraint(equalToConstant: 52),
            
            categoryView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 24),
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
extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieLargeCell", for: indexPath) as! MovieLargeCell
        let model = movieViewModels[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movieViewModels[indexPath.row]
        let movieDetailVC = MovieDetail()
        movieDetailVC.movie = movie
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
}
