import Foundation

// MARK: - Variables and Constants

var a = 23 //variable 
let b = 43 //constant
a = 24


// MARK: - String Interpolation
var mystr_name:String = "Shushant"
var shu_age = 2025-2006
print("Hello \(mystr_name), you are \(shu_age) years old")


// MARK: - Arrays and Dictionary
var my_arr:[String] = ["Shush","Prisha","Rajneet"]
var my_arr2 = [Int]()  //empty array
my_arr.append("DOM")
my_arr.count

var dict_one: [Int:String] = [1:"Shushant",2:"Prisha",3:"DOM",4:"DOM"]
var dict_two = [String:String]()
print(dict_one.keys)
print(dict_one.values)
print(dict_one[2]!)
dict_one[4] = "Kavya"

struct userInfo{
    var name:String;
    var age:Int
}


var dict_three:[Int:userInfo] = [1:userInfo(name:"Shushant",age:18)]

// MARK: - Loops

for i  in 0..<5{
    print(i)
}
var i = 0
while i <= 5{
    if(i==3){
        print("mid")
    }else{
        print(i)
    }
    
    i += 1
}


// MARK: - Functions


func printx(_ x:Int){
    print(x)
}

printx(23)


// MARK: - Optionals

struct MyUsers{
    var userName:String = "Shushant"
    var bio:String?
    
    init(userName: String, bio: String? = nil) {
        self.userName = userName
        self.bio = bio
    }
}

let batman = MyUsers(userName: "Batman", bio: "I am Batman")

func printUserInfo(){
    print("Name is: \(batman.userName)")
    
//    if let unwrappedBio = bio{
//        print("Bio is: \(unwrappedBio)")
//    }else{
//        print("Bio is empty")
//    }
    
    guard let guardedBio = batman.bio else {
        print("Bio is empty")
        return
    }
    print("Bio is: \(guardedBio)")
}

printUserInfo()

// MARK: - Enums

enum Gender{
    case MALE
    case FEMALE
    case OTHER
}

struct MYUSER2{
    var name:String
    var age:Int
    var gender:Gender
    
    init(name: String, age: Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    func printInfo() -> Void{
        print("\(self.name) is \(self.age) year old \(self.gender)")
    }
}


var kavya = MYUSER2(name: "Kavya", age: 20, gender: .FEMALE)
var shushant = MYUSER2(name: "Shushant", age: 19, gender: .MALE)

kavya.printInfo()
shushant.printInfo()


// MARK: - Protocols

protocol Vehicle{
    var id:String {get}
    var name:String {get}
    var wheels:Int {get}
}

struct Car:Vehicle{
    let id: String = NSUUID().uuidString
    var name: String
    var wheels: Int
    
    init(name: String, wheels: Int) {
        self.name = name
        self.wheels = wheels
    }
    
    func getInfo(){
        print("\(self.name) have \(self.wheels) wheel with an ID : \(self.id)")
    }
    
}

var thar = Car(name: "THAR", wheels: 4)
var ferrari = Car(name: "Ferrari", wheels: 4)

thar.getInfo()
ferrari.getInfo()


// MARK: - Extension

protocol Shape{
    var name:String {get}
    
}
extension Shape{
    func getArea(){
        print("Implement first please")
    }
}

struct Square:Shape{
    let  name:String
    let numberOfSides:Int
    func getArea(){
        print("The Area of \(name) is \(numberOfSides * numberOfSides)")
    }
}

struct Rectangle:Shape{
    let  name:String
    let numberOfSides:Int
    let width:Int
    let height:Int
}


let s1 = Square(name: "S1", numberOfSides: 4)
s1.getArea()
let r1 = Rectangle(name: "R1", numberOfSides: 4, width: 4 , height: 2)
r1.getArea()

// MARK: - Extension part 2

extension String{
    func getStringCount() -> Int{
        return self.count
    }
    
    subscript(i:Int) -> Character{
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}
let name:String = "Shushant12"
name[2]
name.getStringCount()

extension Int{
    func isEven() -> Bool{
        return self % 2 == 0
    }
}

let numbers:Int = 23
numbers.isEven()

// MARK: - Generics

func returnWhatEverEntered<dataType>(x:dataType) -> dataType{
    return x
}


//implementing a generic array
struct MyArray<DataType> {
    private var list:[DataType] = []
    
    mutating func push(_ item: DataType){
        list.append(item)
    }
    
    func printList() {
        print(list)
    }
}

var strArr = MyArray<String>()
strArr.push("Shushant")
strArr.push("Kavya")
strArr.printList()

var IntArr = MyArray<Int>()
IntArr.push(23)
IntArr.push(34)
IntArr.printList()

// MARK: - Higher Order functions

// HOF -> Eiter return a function as a result or take a function as parameter

//map
let names:[String] = ["shusnant","prisha","kavya","rajneet"]
let upperCasedNames = names.map { $0.uppercased() }


// MARK: - Memory Management

class Person{
    var name:String
    var petName:Pet?
    
    init(name: String) {
        self.name = name
        print("=> \(self.name) is initilised")
    }
    
    deinit{
        print("=> \(self.name) is denialised")
    }
    
}

class Pet{
    var name:String
    weak var ownerName:Person?
    
    init(name: String) {
        self.name = name
        print("=> \(self.name) is initialised")
    }
    
    deinit{
        print("=> \(self.name) is deallocated")
    }
    
}

var shushi: Person? = Person(name: "Shushant")
var tubby: Pet? = Pet(name: "Tubby")


shushi?.petName = tubby
tubby?.ownerName = shushi


shushi = nil
tubby = nil

//MARK: - Closures

func addTwoNumbers(_ num1:Int, _ num2:Int) -> Int{
    return num1 + num2
}

var addTwoNumbersWithClousres: (Int,Int) -> Int = { (num1,num2) in
    return num1+num2
}

var addTwoNumbersWithClousres2: (Int,Int) -> Int = { return $0 + $1 }

//MARK: - Closures 2

func printGreetings( morning: Bool, name:String) -> Void{
    if(morning){
        print("Good morning \(name)!")
    }
}

func printGreetingsClousres( morning: Bool, name:() -> String) -> Void{
    if(morning){
        print("Good morning \(name())")
    }
}

func assignName(name:String) -> String{
    print("DEBUG: Assign name was called")
    return name
}

//printGreetings(morning:false, name: assignName(name: "Shushant"))
printGreetingsClousres(morning: false) {
    assignName(name: "Shushi")
}


// MARK: - Weak vs Unowned

/*
 weak: It is used with the property of class which potentially can be nil
 when using weak the property should be mutable(var) and should be optional
 
 unowned: Its is used with the property of class which is important for the class
 
 when using this keyword it cannot be optional
 
 */


// MARK: - Value vs Refrence type

//Classes are Refrence type while structs are value type







 









