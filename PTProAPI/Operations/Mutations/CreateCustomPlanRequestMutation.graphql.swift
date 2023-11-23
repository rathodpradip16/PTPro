// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateCustomPlanRequestMutation: GraphQLMutation {
    static let operationName: String = "CreateCustomPlanRequest"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation CreateCustomPlanRequest($userId: String, $name: String, $email: String, $country: String, $number: String, $no_Of_units_list: String) { CreateCustomPlanRequest( userId: $userId name: $name email: $email country: $country number: $number no_Of_units_list: $no_Of_units_list ) { __typename status message } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var name: GraphQLNullable<String>
    public var email: GraphQLNullable<String>
    public var country: GraphQLNullable<String>
    public var number: GraphQLNullable<String>
    public var no_Of_units_list: GraphQLNullable<String>

    public init(
      userId: GraphQLNullable<String>,
      name: GraphQLNullable<String>,
      email: GraphQLNullable<String>,
      country: GraphQLNullable<String>,
      number: GraphQLNullable<String>,
      no_Of_units_list: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.name = name
      self.email = email
      self.country = country
      self.number = number
      self.no_Of_units_list = no_Of_units_list
    }

    public var __variables: Variables? { [
      "userId": userId,
      "name": name,
      "email": email,
      "country": country,
      "number": number,
      "no_Of_units_list": no_Of_units_list
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("CreateCustomPlanRequest", CreateCustomPlanRequest?.self, arguments: [
          "userId": .variable("userId"),
          "name": .variable("name"),
          "email": .variable("email"),
          "country": .variable("country"),
          "number": .variable("number"),
          "no_Of_units_list": .variable("no_Of_units_list")
        ]),
      ] }

      var createCustomPlanRequest: CreateCustomPlanRequest? { __data["CreateCustomPlanRequest"] }

      /// CreateCustomPlanRequest
      ///
      /// Parent Type: `CreateCustomPlanRequestType`
      struct CreateCustomPlanRequest: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.CreateCustomPlanRequestType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("message", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var message: String? { __data["message"] }
      }
    }
  }

}