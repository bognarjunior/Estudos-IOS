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

let user = (name: "Bognar", age: 38)
let (name, age) = user
print(name)
print(age)
