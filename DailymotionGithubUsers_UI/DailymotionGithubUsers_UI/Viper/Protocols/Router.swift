//
//  Routable.swift
//  DailymotionGithubUsers_UI
//
//  Created by Adrian Kaczmarek on 15/03/2021.
//

import UIKit

public protocol Routable: AnyObject {
    var _presenter: Presentable! { get set }
    var viewController: UIViewController { get }
    var nextScreens: [NextScreen] { get set }

    func navigate(to screen: NextScreen, nextScreens: [NextScreen]?)
    func embedNavigationController(closeButton: Bool) -> UINavigationController
    func show(in window: UIWindow?, embedInNavigationController: Bool, makeKeyAndVisible: Bool)
    func show(from: UIViewController, embedInNavigationController: Bool)
    func present(_ viewToPresent: UIViewController)
    func present(from: UIViewController,
                 embedInNavigationController: Bool,
                 presentationStyle: UIModalPresentationStyle,
                 transitionStyle: UIModalTransitionStyle,
                 closeButton: Bool,
                 completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func switchRootViewController(embedInNavigationController: Bool)
}

public extension Routable {
    var isNextScreen: Bool { return !nextScreens.isEmpty }

    func navigateToNextScreen() {
        guard let nextScreen = nextScreens.first else { return }
        navigate(to: nextScreen)
    }

    func navigateToNextScreenOrDismiss() {
        if isNextScreen {
            navigateToNextScreen()
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    func navigate(to screen: NextScreen) {
        navigate(to: screen, nextScreens: nil)
    }

    func navigate(to screen: NextScreen, nextScreen: NextScreen) {
        navigate(to: screen, nextScreens: [nextScreen])
    }

    func navigate(to screens: [NextScreen]) {
        guard let firstScreen = screens.first else { return }
        navigate(to: firstScreen, nextScreens: .init(screens.dropFirst()))
    }

    func popOrDismiss() {
        if let navigation = getNavigationController(), navigation.viewControllers.count > 1 {
            navigation.popViewController()
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    func getNavigationController() -> UINavigationController? {
        return viewController.navigationController ?? viewController.parent?.navigationController
    }
}

open class Router: Routable {
    public weak var _presenter: Presentable!
    public var viewController: UIViewController {
        _presenter._view
    }

    let screenNavigator: ScreenNavigable

    public var nextScreens: [NextScreen] = []

    public init(screenNavigator: ScreenNavigable = ScreenNavigator()) {
        self.screenNavigator = screenNavigator
    }

    public func navigate(to screen: NextScreen, nextScreens: [NextScreen]?) {
        let module = screen.module.build(data: screen.data)
        module.router?.nextScreens = nextScreens ?? .init(self.nextScreens.dropFirst())

        switch screen.navigationType {
        case .switchRoot(let embedInNavigationController):
            module.router?.switchRootViewController(embedInNavigationController: embedInNavigationController)
        case let .show(from, embedInNavigationController):
            module.router?.show(from: from ?? viewController, embedInNavigationController: embedInNavigationController)
        case .present(let presentation):
            module.router?.present(
                from: presentation.from,
                embedInNavigationController: presentation.embedInNavigationController,
                presentationStyle: presentation.presentationStyle,
                transitionStyle: presentation.transitionStyle,
                closeButton: presentation.closeButton,
                completion: presentation.completion)
        }
    }

    public func embedNavigationController(closeButton: Bool = false) -> UINavigationController {
        return getNavigationController() ?? viewController.embedInNavigationController(closeButton: closeButton)
    }

    public func switchRootViewController(embedInNavigationController: Bool = false) {
        let view = embedInNavigationController ? embedNavigationController() : viewController
        screenNavigator.changeRoot(to: view)
    }

    public func show(in window: UIWindow?, embedInNavigationController: Bool = false, makeKeyAndVisible: Bool = true) {
        let view = embedInNavigationController ? embedNavigationController() : viewController
        window?.rootViewController = view
        if makeKeyAndVisible {
            window?.makeKeyAndVisible()
        }
    }

    public func show(from: UIViewController, embedInNavigationController: Bool) {
        let view = embedInNavigationController ? embedNavigationController() : viewController
        from.show(view, sender: nil)
    }

    public func present(from: UIViewController,
                 embedInNavigationController: Bool = false,
                 presentationStyle: UIModalPresentationStyle = .currentContext,
                 transitionStyle: UIModalTransitionStyle = .coverVertical,
                 closeButton: Bool = false,
                 completion: (() -> Void)? = nil) {
        let view = embedInNavigationController ? embedNavigationController(closeButton: closeButton) : viewController
        view.modalPresentationStyle = presentationStyle
        view.modalTransitionStyle = transitionStyle

        from.present(view, animated: true, completion: completion)
    }

    public func present(_ viewToPresent: UIViewController) {
        viewController.present(viewToPresent, animated: true, completion: nil)
    }

    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        dismissPresentedView(animated: animated) { [weak self] in
            guard let `self` = self else { return }

            if self.viewController.presentingViewController != nil {
                self.viewController.dismiss(animated: animated, completion: completion)
            } else {
                self.getNavigationController()?.popViewController(animated: animated, completion)
            }
        }
    }

    private func dismissPresentedView(animated: Bool, completion: (() -> Void)?) {
        guard let presentedView = viewController.presentedViewController else {
            completion?()
            return
        }

        presentedView.dismiss(animated: animated, completion: completion)
    }
}

private extension UIViewController {
    func embedInNavigationController(closeButton: Bool = false) -> UINavigationController {
        let controller = StyledNavigationController(rootViewController: self)

        if closeButton {
            controller.addCloseButton()
        }

        return controller
    }
}
