## Template Information

| Name      | Description       |
| --------- | ----------------- |
| File name | json/swift4.stencil |
| Invocation example | `swiftgen json -t swift4 …` |
| Language | Swift 4 |
| Author | David Jennes |

## When to use it

- When you need to generate *Swift 4* code

## Customization

You can customize some elements of this template by overriding the following parameters when invoking `swiftgen` in the command line, using `--param <paramName>=<newValue>`

| Parameter Name | Default Value | Description |
| -------------- | ------------- | ----------- |
| `documentName` | `Document` | Allows you to change the prefix of the generated `enum` for each document. |
| `enumName` | `Plist` | Allows you to change the name of the generated `enum` containing all files. |
| `publicAccess` | N/A | If set, the generated constants will be marked as `public`. Otherwise, they'll be declared `internal`. |

## Generated Code

**Extract:**

```swift
internal enum JSON {
  internal enum Info {
    private static let _document = JSONDocument(path: "info.json")
    internal static let key1: String = _document["key1"]
    internal static let key2: String = _document["key2"]
    internal static let key3: [String: Any] = _document["key3"]
  }
  internal enum Sequence {
    internal static let items: [Int] = objectFromJSON(at: "sequence.json")
  }
}
```

[Full generated code](https://github.com/SwiftGen/SwiftGen/blob/master/Tests/Fixtures/Generated/JSON/swift4-context-all.swift)

## Usage example

```swift
// This will be an dictionary
let foo = JSON.Info.key3

// This will be an [Int]
let bar = JSON.Sequence.items
```