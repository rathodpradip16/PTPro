// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class WriteUserReviewMutation: GraphQLMutation {
  public static let operationName: String = "writeUserReview"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation writeUserReview($reservationId: Int!, $listId: Int!, $reviewContent: String!, $rating: Float!, $receiverId: String!) { writeUserReview( reservationId: $reservationId listId: $listId reviewContent: $reviewContent rating: $rating receiverId: $receiverId ) { __typename status errorMessage } }"#
    ))

  public var reservationId: Int
  public var listId: Int
  public var reviewContent: String
  public var rating: Double
  public var receiverId: String

  public init(
    reservationId: Int,
    listId: Int,
    reviewContent: String,
    rating: Double,
    receiverId: String
  ) {
    self.reservationId = reservationId
    self.listId = listId
    self.reviewContent = reviewContent
    self.rating = rating
    self.receiverId = receiverId
  }

  public var __variables: Variables? { [
    "reservationId": reservationId,
    "listId": listId,
    "reviewContent": reviewContent,
    "rating": rating,
    "receiverId": receiverId
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("writeUserReview", WriteUserReview?.self, arguments: [
        "reservationId": .variable("reservationId"),
        "listId": .variable("listId"),
        "reviewContent": .variable("reviewContent"),
        "rating": .variable("rating"),
        "receiverId": .variable("receiverId")
      ]),
    ] }

    public var writeUserReview: WriteUserReview? { __data["writeUserReview"] }

    /// WriteUserReview
    ///
    /// Parent Type: `CommonType`
    public struct WriteUserReview: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.CommonType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
