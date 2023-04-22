//
//  SearchViewController.swift
//  Moviemax
//
//  Created by Лаванда on 06.04.2023.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
    func getSearchMovies(movies: [Movie])
}


final class SearchViewController: UIViewController, UICollectionViewDelegate {
    
    private var movies: [Movie] = [Movie]()
    private var startMovies: [Movie] = [Movie]()
    
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
        categoryView.myDelegate = self
        searchView.delegate = self
        addViews()
        setConstraints()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviesCollection.reloadData()
    }
    
    private func fetchData() {
        
        NetworkManager.shared.getPopularMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.startMovies = movies
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func addViews() {
        view.addSubview(searchLabel)
        view.addSubview(searchView)
        view.addSubview(categoryView)
        view.addSubview(moviesCollection)
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
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieLargeCell", for: indexPath) as! MovieLargeCell
        let model = movies[indexPath.row]
        cell.set(id: model.id)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let movieDetailVC = MovieDetail()
        movieDetailVC.id = movie.id
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

extension SearchViewController: SearchViewDelegate {
    func getSearchMovies(movies: [Movie]) {
        self.movies = movies
        self.startMovies = movies
        DispatchQueue.main.async {
            self.moviesCollection.reloadData()
        }
    }
}

extension SearchViewController: CategoryCollectionViewDelegate {
    func sortOfCategory(categories: String) {
        if categories == "All" {
            self.movies = self.startMovies
            DispatchQueue.main.async {
                self.moviesCollection.reloadData()
            }
            return
        }
        var sortMovie: [Movie] = []
        for movie in startMovies {
            let id = movie.id
            NetworkManager.shared.getMovieDetail(id: id) { result in
                    switch result {
                    case .success(let film):
                        if let genres = film.genres {
                            if  genres.count > 0 {
                                if genres[0].name == categories {
                                    sortMovie.append(movie)
                                }
                            }
                        }
                        self.movies = sortMovie
                        DispatchQueue.main.async {
                            self.moviesCollection.reloadData()
                        }
                    case .failure(let error):
                        print(error)
                }
            }
        }
    }
}
