// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class SubmitForVerificationMutation: GraphQLMutation {
  public static let operationName: String = "submitForVerification"
  public static let operationDocument: Apollo.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("submitForVerification", SubmitForVerification?.self, arguments: [
        "id": .variable("id"),
        "listApprovalStatus": .variable("listApprovalStatus")
      ]),
    ] }

    public var submitForVerification: SubmitForVerification? { __data["submitForVerification"] }

    /// SubmitForVerification
    ///
    /// Parent Type: `EditListingResponse`
    public struct SubmitForVerification: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.EditListingResponse }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("id", Int?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var id: Int? { __data["id"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
