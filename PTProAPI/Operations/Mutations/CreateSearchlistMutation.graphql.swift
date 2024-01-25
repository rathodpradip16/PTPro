// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateSearchlistMutation: GraphQLMutation {
    static let operationName: String = "CreateSearchlist"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation CreateSearchlist($userId: String, $dates: String) { CreateSearchlist(userId: $userId, dates: $dates) { __typename status errorMessage } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var dates: GraphQLNullable<String>

    public init(
      userId: GraphQLNullable<String>,
      dates: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.dates = dates
    }

    public var __variables: Variables? { [
      "userId": userId,
      "dates": dates
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("CreateSearchlist", CreateSearchlist?.self, arguments: [
          "userId": .variable("userId"),
          "dates": .variable("dates")
        ]),
      ] }

      var createSearchlist: CreateSearchlist? { __data["CreateSearchlist"] }

      /// CreateSearchlist
      ///
      /// Parent Type: `SearchListing`
      struct CreateSearchlist: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SearchListing }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}