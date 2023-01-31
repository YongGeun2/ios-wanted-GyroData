//
//  CustomDataCell.swift
//  GyroData
//
//  Created by Baem, Dragon on 2023/01/31.
//

import UIKit

class CustomDataCell: UITableViewCell {
    // MARK: Static Properties
    
    static let identifier = "CustomDataCell"
    
    // MARK: Private Properties
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 1
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        label.numberOfLines = 1
        return label
    }()
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    // TODO: DateFormat 변경
    private let dateTitleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 15
        stackView.distribution = .equalSpacing
        return stackView
    }()
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // MARK: Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Internal Methods
    
    func configureLabel(data: MotionData) {
        dateLabel.text = data.date.description
        titleLabel.text = data.title
        valueLabel.text = String(data.value)
    }
    
    // MARK: Private Methods
    
    private func setUpDateTitleStackView() {
        dateTitleStackView.addArrangedSubview(dateLabel)
        dateTitleStackView.addArrangedSubview(titleLabel)
    }
    
    private func setUpMainStackView() {
        mainStackView.addArrangedSubview(dateTitleStackView)
        mainStackView.addArrangedSubview(valueLabel)
    }
    
    private func configureLayout() {
        setUpDateTitleStackView()
        setUpMainStackView()
        
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

