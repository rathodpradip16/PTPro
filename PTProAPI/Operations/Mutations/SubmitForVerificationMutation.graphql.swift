// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class SubmitForVerificationMutation: GraphQLMutation {
    static let operationName: String = "submitForVerification"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation submitForVerification($id: Int!, $listApprovalStatus: String) { submitForVerification(id: $id, listApprovalStatus: $listApprovalStatus) { __typename id status errorMessage } }"#
      ))

    public var id: Int
    public var listApprovalStatus: GraphQLNullable<String>

    public init(
      id: Int,
      listApprovalStatus: GraphQLNullable<String>
    ) {
      self.id = id
      self.listApprovalStatus = listApprovalStatus
    }

    public var __variables: Variables? { [
      "id": id,
      "listApprovalStatus": listApprovalStatus
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("submitForVerification", SubmitForVerification?.self, arguments: [
          "id": .variable("id"),
          "listApprovalStatus": .variable("listApprovalStatus")
        ]),
      ] }

      var submitForVerification: SubmitForVerification? { __data["submitForVerification"] }

      /// SubmitForVerification
      ///
      /// Parent Type: `EditListingResponse`
      struct SubmitForVerification: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.EditListingResponse }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var id: Int? { __data["id"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}