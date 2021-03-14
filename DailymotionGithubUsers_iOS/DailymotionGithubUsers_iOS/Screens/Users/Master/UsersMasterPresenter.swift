//
//  UsersMasterPresenter.swift
//  DailymotionGithubUsers_iOS
//
//  Created by Adrian Kaczmarek on 14/03/2021.
//

import Foundation
import DailymotionGithubUsers_UI
import DailymotionGithubUsers_Core

final class UsersMasterPresenter: Presenter, UsersMasterPresentable {
    // MARK: - Private Properties
    
    private let usersRepository: UsersRepositoryProtocol

    private var cells: [CellViewModel] = []

    // MARK: - Initialization

    init(view: UsersMasterViewable,
         router: UsersMasterRouterable,
         usersRepository: UsersRepositoryProtocol) {
        self.usersRepository = usersRepository
        super.init(view, router)
    }
    
    // MARK: - Binding

    override func bind() {
        super.bind()
        retrieveUsers()
    }
    
    private func retrieveUsers() {
        view?.showLoader(true)
        usersRepository.retrieveUsers(didRetrieveUsers)
    }
    
    private var didRetrieveUsers: ([User]?) -> Void {
        return { [weak self] users in
            DispatchQueue.main.async {
                self?.view?.showLoader(false)
                
                users != nil
                    ? self?.loadCells(with: users!)
                    : debugPrint("Handle errors")
            }
        }
    }
    
    // MARK: - Loading Cells
    
    private func loadCells(with users: [User]) {
        let cells: [CellViewModel] = users.map { user in
            let cell = UserCellModel(user: user) { [unowned self] in
                self.didSelect(user)
            }
            return cell
        }
        
        self.cells = cells
        view?.load(cells)
    }
    
    // MARK: - Selecting User
    
    private func didSelect(_ user: User) {
        router.navigateToUserDetail(user)
    }
}

// swiftlint:disable all
extension UsersMasterPresenter {
    var view: UsersMasterViewable? {
        return _view as? UsersMasterViewable
    }
    var router: UsersMasterRouterable {
        return _router as! UsersMasterRouterable
    }
}
// swiftlint:enable all
