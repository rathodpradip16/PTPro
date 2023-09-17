// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserLanguageQuery: GraphQLQuery {
  public static let operationName: String = "userLanguage"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query userLanguage { userLanguages { __typename status errorMessage result { __typename label value } } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("userLanguages", UserLanguages?.self),
    ] }

    public var userLanguages: UserLanguages? { __data["userLanguages"] }

    /// UserLanguages
    ///
    /// Parent Type: `UserLanguagesType`
    public struct UserLanguages: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserLanguagesType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("result", [Result?]?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var result: [Result?]? { __data["result"] }

      /// UserLanguages.Result
      ///
      /// Parent Type: `LanguageItemType`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.LanguageItemType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("label", String?.self),
          .field("value", String?.self),
        ] }

        public var label: String? { __data["label"] }
        public var value: String? { __data["value"] }
      }
    }
  }
}
