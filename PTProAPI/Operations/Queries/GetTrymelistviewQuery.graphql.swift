// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetTrymelistviewQuery: GraphQLQuery {
    static let operationName: String = "getTrymelistview"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getTrymelistview($userId: String!, $listId: Int!) { getTrymelistview(userId: $userId, listId: $listId) { __typename errorMessage status } }"#
      ))

    public var userId: String
    public var listId: Int

    public init(
      userId: String,
      listId: Int
    ) {
      self.userId = userId
      self.listId = listId
    }

    public var __variables: Variables? { [
      "userId": userId,
      "listId": listId
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getTrymelistview", GetTrymelistview?.self, arguments: [
          "userId": .variable("userId"),
          "listId": .variable("listId")
        ]),
      ] }

      var getTrymelistview: GetTrymelistview? { __data["getTrymelistview"] }

      /// GetTrymelistview
      ///
      /// Parent Type: `Trymelistviews`
      struct GetTrymelistview: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Trymelistviews }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("errorMessage", String?.self),
          .field("status", String?.self),
        ] }

        var errorMessage: String? { __data["errorMessage"] }
        var status: String? { __data["status"] }
      }
    }
  }

}