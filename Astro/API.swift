//  This file was automatically generated and should not be edited.

import Apollo

public final class GetAllTasksQuery: GraphQLQuery {
  public let operationDefinition =
    "query getAllTasks {\n  getAllTasks {\n    __typename\n    ...TaskFullDetails\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(TaskFullDetails.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getAllTasks", type: .nonNull(.list(.nonNull(.object(GetAllTask.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAllTasks: [GetAllTask]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getAllTasks": getAllTasks.map { (value: GetAllTask) -> ResultMap in value.resultMap }])
    }

    public var getAllTasks: [GetAllTask] {
      get {
        return (resultMap["getAllTasks"] as! [ResultMap]).map { (value: ResultMap) -> GetAllTask in GetAllTask(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetAllTask) -> ResultMap in value.resultMap }, forKey: "getAllTasks")
      }
    }

    public struct GetAllTask: GraphQLSelectionSet {
      public static let possibleTypes = ["Task"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(TaskFullDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, text: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Task", "id": id, "text": text])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var taskFullDetails: TaskFullDetails {
          get {
            return TaskFullDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct TaskFullDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment TaskFullDetails on Task {\n  __typename\n  id\n  text\n}"

  public static let possibleTypes = ["Task"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .scalar(String.self)),
    GraphQLField("text", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: String? = nil, text: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Task", "id": id, "text": text])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: String? {
    get {
      return resultMap["id"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var text: String? {
    get {
      return resultMap["text"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "text")
    }
  }
}