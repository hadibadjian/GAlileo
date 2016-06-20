//: Playground - noun: a place where people can play
import Foundation

// Mark: Blocks
var completionHandlers: [(Double) -> Void] = []

func makePaymentWithCompletion(/*@noescape*/ completion: (amount: Double) -> Void) {
  print("something happened here")
  completionHandlers.append(completion)
}

makePaymentWithCompletion { amount in
  print(amount, "payment is processed")
  print("")
}

// TODO: @noescape

// Mark: Blocks in action
let names = ["hadi", "hosein", "mehdi", "hamed"]
let namesSorted1 = names.sort { (str1: String, str2: String) -> Bool in
  return str1 < str2
}
namesSorted1

let namesSorted2 = names.sort { $0 < $1 }
namesSorted2

// Mark: map

let mapped = names.map { $0.capitalizedString }
mapped

struct User {
  var firstName: String
  var lastName: String
}

let users = [
  User(firstName: "Hadi", lastName: "Badjian"),
  User(firstName: "Mehdi", lastName: "Badjian")
]

// Mark: flatMap

let fullnames = users.flatMap { $0.firstName + " " + $0.lastName}
fullnames

let nestedArray = [[1,2,3], [4,5,6]]
let items = nestedArray.flatten().map { $0 * 2 }
let transformed = nestedArray.flatMap{ $0 }
items
transformed

// Using flatMap to filter optional containers with nil value
let nestedItems: [Int?] = [1, 2, .Some(3), .None, 5, 6, 7]
let nestedItemsT = nestedArray.flatMap { $0 }
nestedItemsT

// Mark: filter

let filteredItems = nestedItems.filter { $0 > 5 }
filteredItems




