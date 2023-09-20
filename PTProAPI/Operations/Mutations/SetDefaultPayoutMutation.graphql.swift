// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class SetDefaultPayoutMutation: GraphQLMutation {
    static let operationName: String = "setDefaultPayout"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation setDefaultPayout($id: Int!, $type: String!) { setDefaultPayout(id: $id, type: $type) { __typename status errorMessage } }"#
      ))

    public var id: Int
    public var type: String

    public init(
      id: Int,
      type: String
    ) {
      self.id = id
      self.type = type
    }

    public var __variables: Variables? { [
      "id": id,
      "type": type
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("setDefaultPayout", SetDefaultPayout?.self, arguments: [
          "id": .variable("id"),
          "type": .variable("type")
        ]),
      ] }

      var setDefaultPayout: SetDefaultPayout? { __data["setDefaultPayout"] }

      /// SetDefaultPayout
      ///
      /// Parent Type: `Payout`
      struct SetDefaultPayout: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.Payout }
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