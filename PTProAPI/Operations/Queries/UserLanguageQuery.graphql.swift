// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class UserLanguageQuery: GraphQLQuery {
    static let operationName: String = "userLanguage"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query userLanguage { userLanguages { __typename status errorMessage result { __typename label value } } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("userLanguages", UserLanguages?.self),
      ] }

      var userLanguages: UserLanguages? { __data["userLanguages"] }

      /// UserLanguages
      ///
      /// Parent Type: `UserLanguagesType`
      struct UserLanguages: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserLanguagesType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("result", [Result?]?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var result: [Result?]? { __data["result"] }

        /// UserLanguages.Result
        ///
        /// Parent Type: `LanguageItemType`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.LanguageItemType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("label", String?.self),
            .field("value", String?.self),
          ] }

          var label: String? { __data["label"] }
          var value: String? { __data["value"] }
        }
      }
    }
  }

}