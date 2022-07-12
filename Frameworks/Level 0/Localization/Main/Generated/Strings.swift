// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum FetchInfo {
    public enum Buttons {
      public enum Random {
        /// Fetch Food Info
        public static let title = L10n.tr("General", "fetchInfo.buttons.random.title")
      }
    }
  }

  public enum Info {
    /// carbs
    public static let carbs = L10n.tr("General", "info.carbs")
    /// cholesterol
    public static let cholesterol = L10n.tr("General", "info.cholesterol")
    /// fiber
    public static let fiber = L10n.tr("General", "info.fiber")
    /// grams per serving
    public static let gramsperserving = L10n.tr("General", "info.gramsperserving")
    /// potassium
    public static let potassium = L10n.tr("General", "info.potassium")
    /// protein
    public static let protein = L10n.tr("General", "info.protein")
    /// sodium
    public static let sodium = L10n.tr("General", "info.sodium")
    /// sugar
    public static let sugar = L10n.tr("General", "info.sugar")
    public enum Buttons {
      public enum More {
        /// more info
        public static let title = L10n.tr("General", "info.buttons.more.title")
      }
    }
    public enum Fat {
      /// fat
      public static let common = L10n.tr("General", "info.fat.common")
      /// saturated fat
      public static let saturated = L10n.tr("General", "info.fat.saturated")
      /// unsaturated fat
      public static let unsaturated = L10n.tr("General", "info.fat.unsaturated")
    }
    public enum Header {
      public enum Calories {
        /// Calories per serving
        public static let description = L10n.tr("General", "info.header.calories.description")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
