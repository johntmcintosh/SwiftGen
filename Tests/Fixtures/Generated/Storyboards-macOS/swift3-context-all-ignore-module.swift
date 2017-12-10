// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import Cocoa
import PrefsWindowController

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: NSStoryboard {
    return NSStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: Any> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateController(withIdentifier: identifier) as? T else {
      fatalError("Controller '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: Any> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialController() as? T else {
      fatalError("Controller is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal protocol SegueType: RawRepresentable { }

internal extension NSSeguePerforming {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue?(withIdentifier: segue.rawValue, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum AdditionalImport: StoryboardType {
    internal static let storyboardName = "AdditionalImport"

    internal static let `private` = SceneType<PrefsWindowController.DBPrefsWindowController>(storyboard: AdditionalImport.self, identifier: "private")
  }
  internal enum Anonymous: StoryboardType {
    internal static let storyboardName = "Anonymous"
  }
  internal enum Dependency: StoryboardType {
    internal static let storyboardName = "Dependency"

    internal static let dependent = SceneType<NSViewController>(storyboard: Dependency.self, identifier: "Dependent")
  }
  internal enum Message: StoryboardType {
    internal static let storyboardName = "Message"

    internal static let messageDetails = SceneType<NSViewController>(storyboard: Message.self, identifier: "MessageDetails")

    internal static let messageList = SceneType<NSViewController>(storyboard: Message.self, identifier: "MessageList")

    internal static let messageListFooter = SceneType<NSViewController>(storyboard: Message.self, identifier: "MessageListFooter")

    internal static let messagesTab = SceneType<CustomTabViewController>(storyboard: Message.self, identifier: "MessagesTab")

    internal static let splitMessages = SceneType<NSSplitViewController>(storyboard: Message.self, identifier: "SplitMessages")

    internal static let windowCtrl = SceneType<NSWindowController>(storyboard: Message.self, identifier: "WindowCtrl")
  }
  internal enum Placeholder: StoryboardType {
    internal static let storyboardName = "Placeholder"

    internal static let dependent = SceneType<NSControllerPlaceholder>(storyboard: Placeholder.self, identifier: "Dependent")

    internal static let window = SceneType<NSWindowController>(storyboard: Placeholder.self, identifier: "Window")
  }
}

internal extension CustomTabViewController {
  internal enum StoryboardSegue: String {
    case embed = "Embed"
    case modal = "Modal"
    case popover = "Popover"
    case sheet = "Sheet"
    case show = "Show"
    case `public`
  }

  func perform(segue: StoryboardSegue, sender: Any? = nil) {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }

  internal enum TypedStoryboardSegue {
    case embed(destination: NSViewController)
    case modal(destination: NSViewController)
    case popover(destination: NSViewController)
    case sheet(destination: NSViewController)
    case show(destination: NSViewController)
    case `public`(destination: NSViewController, segue: FadeSegue.SlowFadeSegue)
    case unnamedSegue

    // swiftlint:disable cyclomatic_complexity
    init(segue: NSStoryboardSegue) {
      switch segue.identifier ?? "" {
      case "Embed":
        guard let vc = segue.destinationController as? NSViewController else {
          fatalError("Destination of segue 'Embed' is not of the expected type NSViewController.")
        }
        self = .embed(destination: vc)
      case "Modal":
        guard let vc = segue.destinationController as? NSViewController else {
          fatalError("Destination of segue 'Modal' is not of the expected type NSViewController.")
        }
        self = .modal(destination: vc)
      case "Popover":
        guard let vc = segue.destinationController as? NSViewController else {
          fatalError("Destination of segue 'Popover' is not of the expected type NSViewController.")
        }
        self = .popover(destination: vc)
      case "Sheet":
        guard let vc = segue.destinationController as? NSViewController else {
          fatalError("Destination of segue 'Sheet' is not of the expected type NSViewController.")
        }
        self = .sheet(destination: vc)
      case "Show":
        guard let vc = segue.destinationController as? NSViewController else {
          fatalError("Destination of segue 'Show' is not of the expected type NSViewController.")
        }
        self = .show(destination: vc)
      case "public":
        guard let segue = segue as? FadeSegue.SlowFadeSegue else {
          fatalError("Segue 'public' is not of the expected type FadeSegue.SlowFadeSegue.")
        }
        guard let vc = segue.destinationController as? NSViewController else {
          fatalError("Destination of segue 'public' is not of the expected type NSViewController.")
        }
        self = .`public`(destination: vc, segue: segue)
      case "":
        self = .unnamedSegue
      default:
        fatalError("Unrecognized segue '\(segue.identifier ?? "")' in CustomTabViewController")
      }
    }
    // swiftlint:enable cyclomatic_complexity
  }
}

internal enum StoryboardSegue {
  internal enum Message: String, SegueType {
    case embed = "Embed"
    case modal = "Modal"
    case popover = "Popover"
    case sheet = "Sheet"
    case show = "Show"
    case `public`
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}