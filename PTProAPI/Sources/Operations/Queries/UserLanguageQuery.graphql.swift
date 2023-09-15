// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserLanguageQuery: GraphQLQuery {
  public static let operationName: String = "userLanguage"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query userLanguage {
        userLanguages {
          __typename
          status
          errorMessage
          result {
            __typename
            label
            value
          }
        }
      }
      """
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("userLanguages", UserLanguages?.self),
    ] }

    public var userLanguages: UserLanguages? { __data["userLanguages"] }

    /// UserLanguages
    ///
    /// Parent Type: `UserLanguagesType`
    public struct UserLanguages: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.UserLanguagesType }
      public static var __selections: [Selection] { [
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
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.LanguageItemType }
        public static var __selections: [Selection] { [
          .field("label", String?.self),
          .field("value", String?.self),
        ] }

        public var label: String? { __data["label"] }
        public var value: String? { __data["value"] }
      }
    }
  }
}
