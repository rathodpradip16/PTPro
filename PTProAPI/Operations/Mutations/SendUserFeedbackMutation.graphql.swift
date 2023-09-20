// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class SendUserFeedbackMutation: GraphQLMutation {
    static let operationName: String = "sendUserFeedback"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation sendUserFeedback($type: String, $message: String) { userFeedback(type: $type, message: $message) { __typename status errorMessage } }"#
      ))

    public var type: GraphQLNullable<String>
    public var message: GraphQLNullable<String>

    public init(
      type: GraphQLNullable<String>,
      message: GraphQLNullable<String>
    ) {
      self.type = type
      self.message = message
    }

    public var __variables: Variables? { [
      "type": type,
      "message": message
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("userFeedback", UserFeedback?.self, arguments: [
          "type": .variable("type"),
          "message": .variable("message")
        ]),
      ] }

      var userFeedback: UserFeedback? { __data["userFeedback"] }

      /// UserFeedback
      ///
      /// Parent Type: `ReportUserResult`
      struct UserFeedback: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ReportUserResult }
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