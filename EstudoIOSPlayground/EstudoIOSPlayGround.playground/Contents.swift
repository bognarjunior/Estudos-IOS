import UIKit
/*
var message = "Olá Mundo!"

print(message)

let number: Int = 32
let PI: Double = 3.14
let name: String = "Bognar Junior"
var isDriver: Bool = true

print(number)
print(PI)
print(name)
print(isDriver)

let x: Int = 10
var y: String
y = String(x)
print(x)

let z: String = "10"
var w: Int
w = Int(z) ?? 0
print(w)
*/

/*
var isHungry = false

if isHungry {
    print("Estou com fome")
} else {
    print("Não estou com fome")
}
*/

/*
var product: String
let company:String = "Apple"

if company == "Google" {
    product = "Android"
} else {
    product = "iPhone"
}

print(product)
*/
/*
var product: String
let company:String = "Apple"

product = company == "Google" ? "Android" : "iPhone"

print(product)
*/

//Tuplas
/*
let coords: (Double, Double) = (34.5, 45.8)

print(coords)
print(coords.0)
print(coords.1)
 */
/*
let coords = (lat: 23.25, lgn: 55.13)
print(coords)
print(coords.lat)
print(coords.lgn)
*/

/*
let camera = (x:10, y: 20, z:1)
let (x, y, z) = camera
print(x)
print(y)
print(z)
 */
/*
let user = (name: "Bognar", age: 38)
let (name, age) = user
print(name)
print(age)
*/

/*
//Arrays
var userNames: [String] = ["Bognar", "Carlos", "Francisca"]
userNames.append("Marcela")
userNames += ["Steve", "Antônio"]
print(userNames)

//Slice(copia a referência do array)
let firstThree = userNames[0...2]
print(firstThree)

//Cria um novo array
let firstTwo = Array(userNames[1...2])
print(firstTwo)

//Número de elementos em um array
print(userNames.count)

//Verifica se e o array está vazio
print(userNames.isEmpty)

//Verifica se no array contém aquele elemento
print(userNames.contains("Maria"))
print(userNames.contains("Bognar"))

//Pega a primeira posição do array
print(userNames.first!)

//Insere um elemento na posição do array desejada
userNames.insert("Anacleto", at: 2)
print(userNames)

//Remove o elemento da posição desejada
userNames.remove(at: 2)
print(userNames)

//Pega a última posição do array
print(userNames.last!)

//Remove a última posição do array
userNames.removeLast()
print(userNames)

//Altera os elementos no range da lista
//Independente se os elementos forem iguais
//No caso troquei 3 por 5 elementos
userNames[1...3] = ["Adamastor", "Oliveira", "Anastasiades", "José", "Alipío"]
print(userNames)

//Trocar elemento por posição através do índice
userNames.swapAt(0, 4)
print(userNames)

//Remover todos os elementos da array
userNames.removeAll()
print(userNames)
*/


//Loop
//var i: Int = 1
/*
while i < 10 {
    print(i)
    i += 1
}
 */
/*
repeat {
    print(i)
    i += 1
} while (i < 10)
*/
/*
//Range inclusive
let range = 0...5
//Range exclusivo
let r = 0..<5
print(range)
*/
/*
var limit: Int = 5
let range = 0...limit

var sum: Int = 0
var count: Int = 10

for i in 0...count {
    print(i)
    sum += i
}
print(sum)
*/
/*
//Ignora o indice
for _ in 0..<10 {
    print("Olá")
}
*/
/*
var count: Int = 10
for i in 0...count where i % 2 == 0 {
    print("\(i) é par")
}
*/
/*
let dollars = [5.1, 5.3, 4.9, 5.3, 5.2]
let days = ["01/02", "02/02", "03/02", "04/02", "05/02"]

for i in 0..<dollars.count where dollars[i] < 5.0{
    print("Valor do dólar no dia \(days[i]) é de \(dollars[i])")
}

for day in days {
    print(day)
}
 */

/*
// Break and Continue
let dollars = [5.1, 5.3, 4.9, 5.3, 5.2, 5.23]
let days = ["01/02", "02/02", "03/02", "04/02", "05/02", "06/02"]

for i in 0..<dollars.count {
    if days[i] == "03/02" {
        break
    }
    print("Valor do dólar no dia \(days[i]) é de \(dollars[i])")
}

for i in 0..<dollars.count {
    if days[i] == "03/02" {
        continue
    }
    print("Valor do dólar no dia \(days[i]) é de \(dollars[i])")
}
*/

//Dictionary
/*
var produtcs: [String:Int] = [:]
produtcs["Apple"] = 5
produtcs["Google"] = 10
produtcs["Samsung"] = 9

print(produtcs)
*/
/*
var products: [Int: String] = [
    1: "Fone de ouvido",
    2: "MacBook",
    3: "Impressora",
    4: "iPhone"
]

print(products)

print(products[2]!)
print(products[12] ?? "Nenhum valor encontrado")

products[2] = "MacBook Air"
print(products[2]!)
print(products.isEmpty)
print(products.count)

//Remover
products[2] = nil
print(products)

for key in products.keys {
    print(key)
}

for val in products.values {
    print(val)
}

for (key, values) in products {
    print("Chave \(key), valor \(values)")
}
*/
/*
// Set
// Não insere valores repetidos
var newDict: [Int: String] = [:]
var newArray: [String] = []
var newSet: Set<Int> = []

newSet.insert(2)
newSet.insert(3)
newSet.insert(5)
newSet.insert(2)
newSet.insert(8)
newSet.insert(2)
newSet.insert(10)

print(newSet)

var response = newSet.insert(5)
print(response)

print(newSet.contains(10))

let removed = newSet.remove(10)
print(removed!)
print(newSet)

newSet.removeAll()
print(newSet)
*/

// Funções
//func megaSenaGenerator() -> Set<Int> {
//    var numbers: Int = 6
//    var result: Set<Int> = []
//
//    while(numbers > 0) {
//        let generated = Int.random(in: 1...60)
//        let res = result.insert(generated)
//
//        if res.inserted {
//            numbers = numbers - 1
//        }
//    }
//    return result
//}
//
//for _ in 1...5 {
//    print(megaSenaGenerator())
//}

/*
func megaSenaGenerator(total: Int) -> Set<Int> {
    var numbers: Int = total
    var result: Set<Int> = []

    while(numbers > 0) {
        let generated = Int.random(in: 1...60)
        let res = result.insert(generated)
        
        if res.inserted {
            numbers = numbers - 1
        }
    }
    return result
}

print(megaSenaGenerator(total: 6))
print(megaSenaGenerator(total: 15))
*/

//
////Optional
//func megaSenaGenerator(total: Int?, maxNumber: Int?) -> Set<Int> {
//    var numbers: Int = total ?? 6
//    var result: Set<Int> = []
//
//    while(numbers > 0) {
//        let generated = Int.random(in: 1...maxNumber ?? 60)
//        let res = result.insert(generated)
//
//        if res.inserted {
//            numbers = numbers - 1
//        }
//    }
//    return result
//}
//
//print(megaSenaGenerator(total: nil, maxNumber: 60))
//print(megaSenaGenerator(total: 15, maxNumber: 60))
//

func fetchProductById(id: Int) -> String {
    let dict = [
        1: "iPhone",
        2: "Macbook Pro",
        3: "Macbook Air",
        4: "iPad"
    ]
//    if let product = dict[id] {
//        return product
//    }
//    return "Nenhum produto encontrado"
    guard let product = dict[id] else { return "Nenhum produto encontrado" }
    return product
}

print(fetchProductById(id: 1))
print(fetchProductById(id: 12))
