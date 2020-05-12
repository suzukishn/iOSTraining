# Codable

Encodable/Decodableプロトコルを準拠したtype aliaseです。Swift4で導入され、JSONのエンコード/デコードを簡潔に実現できるようになりました。

以下は、JSONをコードで扱いやすいように構造体に変換する例です。
```
// JSON
{
  "companyName" : "Sample, Inc.",
  "employees" : [
    {
      "firstName" : "John",
      "lastName" : "Doe",
      "age" : 30,
    },
    {
      "firstName" : "Anna",
      "lastName" : "Smith"
    },
    {
      "firstName" : "Peter",
      "lastName" : "Jones"
    }
  ]
}
```

```swift
// 構造体
struct Company: Codable {
  let companyName: String
  let employees: [Employee]
}

struct Employee: Codable {
  let firstName: String
  let lastName: String
  let age: Int?
}
```

```swift
// 変換
let jsonString = """
{
  "companyName" : "Sample, Inc.",
  "employees" : [
    {
      "firstName" : "John",
      "lastName" : "Doe",
      "age" : 30,
    },
    {
      "firstName" : "Anna",
      "lastName" : "Smith"
    },
    {
      "firstName" : "Peter",
      "lastName" : "Jones"
    }
  ]
}
"""

// decode
let data = jsonString.data(using: .utf8) ?? Data() // Data型に変換
let company = try? JSONDecoder().decode(Company.self, from: data) // CompanyがCodableに準拠しているため、この一行で変換できる
print("会社名は" + (company?.companyName ?? "") + "です") // 構造体なので扱いやすくなる
print("従業員は" + (company?.employees.count ?? 0).description + "人です")

// encode
let encodedData = try? JSONEncoder().encode(company) // Company型からData型に変換
let jsonObject = try? JSONSerialization.jsonObject(with: encodedData ?? Data(), options: .allowFragments) // JSONの形に戻すことも可能
print(jsonObject ?? "")
```
