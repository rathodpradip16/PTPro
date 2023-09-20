// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ManagePublishStatusMutation: GraphQLMutation {
    static let operationName: String = "managePublishStatus"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation managePublishStatus($listId: Int!, $action: String!) { managePublishStatus(listId: $listId, action: $action) { __typename status errorMessage } }"#
      ))

    public var listId: Int
    public var action: String

    public init(
      listId: Int,
      action: String
    ) {
      self.listId = listId
      self.action = action
    }

    public var __variables: Variables? { [
      "listId": listId,
      "action": action
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("managePublishStatus", ManagePublishStatus?.self, arguments: [
          "listId": .variable("listId"),
          "action": .variable("action")
        ]),
      ] }

      var managePublishStatus: ManagePublishStatus? { __data["managePublishStatus"] }

      /// ManagePublishStatus
      ///
      /// Parent Type: `AllList`
      struct ManagePublishStatus: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllList }
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