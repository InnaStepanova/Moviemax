//
//  TestVC.swift
//  Moviemax
//
//  Created by user on 7.04.23.
//

import UIKit


class MainVC : UIViewController {
    
    // MARK: - Properties
    
    private lazy var boxCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width, height: 80)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor(named: "BackgroundScreenColor")
        collectionView.contentInsetAdjustmentBehavior = .scrollableAxes
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(MovieLittleCell.self, forCellWithReuseIdentifier: "boxCollection")
        
        return collectionView
    }()
    
    private lazy var filmCollectionView = FilmCellView(delegate: self)
    private lazy var categoryCollectionView = CategoryCollectionView()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = getUserFullNameData()
        label.font = Resources.Fonts.plusJakartaSansSemiBold(with: 18)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "only streaming movie lovers"
        label.font = Resources.Fonts.plusJakartaSans(with: 12)
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var boxLabel: UILabel = {
        let label = UILabel()
        label.text = "Box Office"
        label.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        label.textColor = .black
        
        return label
    }()
    
    private let networkManager = NetworkManager.shared
    private var popularMovies: [Movie] = []
    private var popularTV: [Movie] = []
    private lazy var currentUser = RealmStorageManager.shared.getCurrentUser()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentUser = RealmStorageManager.shared.getCurrentUser() {
            self.currentUser = currentUser
        }
        self.navigationController?.navigationBar.isHidden = true
        setupView()
        getPopularFilm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCurrentUser()
        getPopularFilm()
        boxCollectionView.reloadData()
        
        UserDefaults.standard.setValue(1, forKey: "FirstRun")
    }
    
    // MARK: - Public methods
    
    func setupView(){
        view.backgroundColor = UIColor(named: "BackgroundScreenColor")
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        view.addSubview(avatarImageView)
        view.addSubview(filmCollectionView)
        view.addSubview(categoryLabel)
        view.addSubview(categoryCollectionView)
        view.addSubview(boxLabel)
        view.addSubview(boxCollectionView)
       
        setConstraints()
    }
    
    func getPopularFilm() {
        networkManager.getPopularMovies { result in
            switch result {
            case .success(let films):
                self.popularMovies = films
            case .failure(let error):
                print(error)
            }
        }
    }

    func getPopularTV() {
        networkManager.getPopularTV { result in
            switch result {
            case .success(let films):
                self.popularTV = films
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func setCurrentUser() {
        guard let currentUser = currentUser else { return }
        nameLabel.text = "Hi, \(currentUser.name) \(currentUser.secondName)"
        if let photo = currentUser.photo {
            self.avatarImageView.image = UIImage(data: photo)
        } else {
            self.avatarImageView.image = UIImage(named: "avatar")
        }
    }
    
    private func getUserFullNameData() -> String {
        var text = "Hi!"
        if let name = currentUser?.name, let secondName = currentUser?.secondName {
            text = "Hi, \(name) \(secondName)"
        } else if let name = currentUser?.name {
            text = "Hi, \(name)"
        } else if let secondName = currentUser?.secondName {
            text = "Hi, \(secondName)"
        }
        
        return text
    }
    
    private func setConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        filmCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        boxLabel.translatesAutoresizingMaskIntoConstraints = false
        boxCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor , constant: 15),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor , constant: 15),
            
            filmCollectionView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 40),
            filmCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -100),
            filmCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            filmCollectionView.heightAnchor.constraint(equalToConstant: 280),
            
            categoryLabel.topAnchor.constraint(equalTo: filmCollectionView.bottomAnchor, constant: 40),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 34),
            
            boxLabel.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 24),
            boxLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            boxLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            boxCollectionView.topAnchor.constraint(equalTo: boxLabel.bottomAnchor, constant: 16),
            boxCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            boxCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            boxCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
    }
}

// MARK: - Collection View DataSource/Delegate

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = popularMovies[indexPath.item]
        let movieDetailVC = MovieDetail(id: movie.id, isTv: false)
//        movieDetailVC.id = movie.id
        navigationController?.pushViewController(movieDetailVC, animated: true)
        print(indexPath.item)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "boxCollection", for: indexPath) as! MovieLittleCell
        let movie = popularMovies[indexPath.item]
        cell.set(id: movie.id)
        return cell
    }
}

// MARK: - FilmCellViewDelegate

extension MainVC: FilmCellViewDelegate {
    
    func showMovieDetailViewController(with model: Movie) {
        let viewController = MovieDetail(id: model.id, isTv: true)
        viewController.id = model.id
        viewController.likeButton.tag = model.id
        navigationController?.pushViewController(viewController, animated: true)
    }
}
