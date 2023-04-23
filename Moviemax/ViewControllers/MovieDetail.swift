
//  MovieDetail.swift
//  Moviemax
//
//  Created by Николай on 04.04.2023.
//

import Foundation
import UIKit

class MovieDetail: UIViewController {
    
    var id: Int! {
        didSet {
            set()
        }
    }
    var buttonTapped = true
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = contentView.frame.size
        scrollView.addSubview(contentView)
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 900))
        
        contentView.addSubview(likeButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(backButton)
        contentView.addSubview(image)
        contentView.addSubview(textLabel)
        contentView.addSubview(filmLabel)
        contentView.addSubview(stackView)
        contentView.addSubview(starStackView)
        contentView.addSubview(textStoryLabel)
        contentView.addSubview(showTextButton)
        contentView.addSubview(castLabel)
        contentView.addSubview(collectionViewAuthor)
        contentView.addSubview(watchNowButton)
        stackView.addArrangedSubview(dateImage)
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(timeImage)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(genreImage)
        stackView.addArrangedSubview(genreLabel)
        starStackView.addArrangedSubview(starImage)
        starStackView.addArrangedSubview(starImage)
        starStackView.addArrangedSubview(starImage)
        starStackView.addArrangedSubview(starImage)
        starStackView.addArrangedSubview(starImage)
        return contentView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "BackButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Movie Detail"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var likeButton = LikeButton()
    //    private lazy var likeButton: UIButton = {
    //        let button = UIButton(type: .system)
    //        button.setImage(UIImage(named: "heart"), for: .normal)
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        button.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
    //        return button
    //    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DriftingHome")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 26
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var filmLabel: UILabel = {
        let label = UILabel.signBigLabel
        label.text = "Drifting Home"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var dateImage: UIImageView = {
        let image = UIImageView.dateImage
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var genreImage: UIImageView = {
        let image = UIImageView.genreImage
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var timeImage: UIImageView = {
        let image = UIImageView.timeImage
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel.hintLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "120min    "
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel.hintLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "24 Feb 2022   "
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel.hintLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Action    "
        return label
    }()
    
    private lazy var starImage: UIImageView = {
        let image = UIImageView.starImage
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textStoryLabel: UILabel = {
        let label = UILabel.signTopLabel
        label.text = "Story Line"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel.hintLabel
        label.numberOfLines = 5
        label.textAlignment = .justified
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var showTextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show more", for: .normal)
        button.titleLabel?.font = UIFont(name: "Plus Jakarta Sans", size: 14)
        //        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showText), for: .touchUpInside)
        return button
    }()
    
    private lazy var castLabel: UILabel = {
        let label = UILabel.signTopLabel
        label.numberOfLines = 5
        label.text = "Cast and Crew"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageArray = ["author1","author2","author3"]
    var nameArray = ["Josh Wats","Bill Kane","Eric Garcia"]
    var profArray = ["Director", "Writers", "Compositor"]
    
    private lazy var collectionViewAuthor: UICollectionView = {
        let collectionView = UICollectionView(frame:.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
        layout.itemSize = CGSize(width: 170, height: 150)
        return layout
    }()
    
    private lazy var watchNowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Watch Now", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Plus Jakarta Sans", size: 24)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(watchNowButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var id: Int?
    var isTv: Bool?
    
    // MARK: - Initialize
    
    init(id: Int, isTv: Bool) {
        self.id = id
        self.isTv = isTv
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        set(id: id, isTV: isTv)
    }
    
    // MARK: - Private methods
    
    private func configureView() {
        view.backgroundColor = .white
        
        collectionViewAuthor.delegate = self
        collectionViewAuthor.dataSource = self
        setContraints()
    }
    
    private func addInRecentwatch(movie: MovieDetailData) {
        guard let currentUser = RealmStorageManager.shared.getCurrentUser() else {return}
        guard let id = movie.id else {return}
        if !RealmStorageManager.shared.hasRecentMovie(withId: id, in: currentUser) {
                let recentMovie = MovieRealm()
        recentMovie.id = movie.id ?? 0
        recentMovie.name = movie.originalTitle ?? ""
        recentMovie.imageUrl = movie.posterPath ?? ""
        recentMovie.date = movie.releaseDate ?? ""
        recentMovie.long = "\(movie.runtime ?? 0)"
            if let genres = movie.genres {
                if genres.count > 0 {
                    recentMovie.category = genres[0].name ?? ""
                }
            }
        RealmStorageManager.shared.recent(user: currentUser, movie: recentMovie)
        }
    }
    
    private func set(id: Int?, isTV: Bool?) {
        guard let id, let isTV else {
            return
        }
        
        if isTV {
            fetchTVData(for: id)
        } else {
            fetchMovieData(for: id)
        }
    }
    
    private func fillViewWithData(for movie: MovieDetailData, image: UIImage) {
        DispatchQueue.main.async {
            self.addInRecentwatch(movie: movie)
            self.image.image = image
            self.filmLabel.text = movie.originalTitle
            if let time = movie.runtime {
                self.timeLabel.text = "\(time) min"
            }
            self.dateLabel.text = movie.releaseDate
            self.genreLabel.text = movie.genres?[0].name
            self.textLabel.text = movie.overview
            if let id = movie.id {
                self.likeButton.tag = id
                self.likeButton.isLike(id: id)
            }
        }
    }
    
    //фунция для перехода в другой VC
    @objc func backButtonPressed () {
        navigationController?.popViewController(animated: true)
    }
    
    //функция для показа полного описания фильма
    @objc func showText(){
        if buttonTapped {
            textLabel.numberOfLines = 10
        } else {
            textLabel.numberOfLines = 5
        }
        buttonTapped = !buttonTapped
    }
    
    //функция для показа фильма
    @objc func watchNowButtonPressed () {
        
    }
    
    //    //функция для добавления в избранное
    //    @objc func likeButtonPressed () {
    //        if heatButton {
    //            likeButton.setImage(UIImage(named: "heart_fill"), for: .normal)
    //        } else {
    //            likeButton.setImage(UIImage(named: "heart"), for: .normal)
    //        }
    //            heatButton = !heatButton
    //    }
}

// MARK: - API

extension MovieDetail {
    
    private func fetchMovieData(for id: Int) {
        NetworkManager.shared.getMovieDetail(id: id) { result in
            switch result {
            case .success(let movie):
                guard let url = movie.posterPath else { return }
                NetworkManager.shared.downloadImage(path: url) { [weak self] image in
                    guard let self, let image else {
                        return
                    }
                    
                    self.fillViewWithData(for: movie, image: image)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchTVData(for id: Int) {
        NetworkManager.shared.getTVDetail(id: id) { result in
            switch result {
            case .success(let movie):
                print("ЭТО TV \(movie)")
                guard let url = movie.posterPath else { return }
                
                NetworkManager.shared.downloadImage(path: url) { [weak self] image in
                    guard let self, let image else {
                        return
                    }
                    
                    self.fillViewWithData(for: movie, image: image)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Layout

extension MovieDetail {
    func setContraints () {
        view.addSubview(scrollView)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 31),
            likeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 31),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 13),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            image.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            image.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 300),
            image.widthAnchor.constraint(equalToConstant: 250),
            
            filmLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
            filmLabel.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: filmLabel.bottomAnchor, constant: 10),
            
            starStackView.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            starStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            
            textStoryLabel.topAnchor.constraint(equalTo: starStackView.bottomAnchor, constant: 5),
            textStoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            textLabel.topAnchor.constraint(equalTo: textStoryLabel.topAnchor, constant: 30),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            showTextButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 0),
            showTextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            showTextButton.widthAnchor.constraint(equalToConstant: 80),
            showTextButton.heightAnchor.constraint(equalToConstant: 30),
            
            castLabel.topAnchor.constraint(equalTo: showTextButton.bottomAnchor, constant: 5),
            castLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            collectionViewAuthor.topAnchor.constraint(equalTo: castLabel.bottomAnchor, constant: 0),
            collectionViewAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionViewAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionViewAuthor.heightAnchor.constraint(equalToConstant: 150),
            
            watchNowButton.topAnchor.constraint(equalTo: collectionViewAuthor.topAnchor, constant: 80),
            watchNowButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            watchNowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            watchNowButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension MovieDetail: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.titleLabel.text = nameArray[indexPath.row]
        cell.subtitleLabel.text = profArray[indexPath.row]
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
}


