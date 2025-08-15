//Variable and constants
var userName = "shushant" //variable
let age:Int=19       //constant
//print("Your name:",userName, "Your id:",userId)

//Range
var range1 = 1...5 // 1 to 5
var range2 = 1..<5 // 1 to 4

//String
var userInfo:String = "User name is \(userName) and his age is \(age)"
userInfo.count

//arrays
var arr:[Int] = [1,2,3,4,5]
func printNumPlus1(nums:[Int]) -> Void{
    for num in nums{
        print(num+1)
    }
}

//functions
func factorial(n:Int)-> Int{
    var result = 1;
    for num in 1...n{
        result *= num
        
    }
    return result
}

//Dictionary
var studentsInfo:[Int:String] = [1:"Shushant",2:"Rohit",3:"Amit"]


//[String: [String: String]]
var crushes = [
    "Shivani":[
        "TimeLine":"Shivani was from 2017-2019",
        "Why":"Shivani was cooll"
    ],
    "MJ":[
        "TimeLine":"MJ was from 2022-23",
        "Why":"MJ was cute"
    ]
]

var MJTimeLIne = crushes["MJ"]?["TimeLine"]
var MJWhy = crushes["MJ"]?["Why"]


//Sets
let sentence:Set = [
    1,2,3,4,5
]

let sentence2:Set = [
    1,3,4,7,8
]

sentence.intersection(sentence2) //common
sentence.union(sentence2)       //all of them combined but duplicated removed
sentence.subtracting(sentence2) //subtract from 1 to 2 (removed)
sentence.symmetricDifference(sentence2) //what is not present in both

//Tuples
var studentInfo:(id:Int, name:String, age:Int)
studentInfo = (122,"Shushant",19)
studentInfo.id
studentInfo.name

//conditional wrapping
var stuName:String? = "shu"
var isLoggedIn:Bool? = true

if let user = stuName, let loggedIn = isLoggedIn{ //both should be true
    //print("\(user) is logged in")
}else{
    //print("user is not logged in")
}


//variable holding a function
func add(a:Int, b:Int) -> Int{
    return a+b
}

var addition:(Int,Int)->Int = add
//print("10 + 90  = \(addition(10,90))")









//CLOSURES
let clo1 = {(n:String) in
    print("Hello \(n)")
}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementByTen()
incrementBySeven()
incrementByTen()
incrementBySeven()


//Enums




//structs

struct Student{
    var name:String = ""
    var age:Int = 0
    var skills:[String] = []
    
    func PrintDetails(){
        print("Name of student is \(name), age is \(age) and his skills are \(skills)")
    }

}

var s1 = Student(name: "Shushant", age: 19, skills: ["fullstack dev","ios dev"])
var s2 = s1
s2.name="Kavya"
//copy is created both time i.e. stucts are value type
s1.name
s2.name


//Classes

class Animal{
    var name:String
    var legs:Int
    
    init(name:String, legs:Int){
        self.name = name
        self.legs = legs
    }
    
    func printInfo(){
        print("\(name) has \(legs) legs")
    }
}

var a1 = Animal(name: "Dog", legs: 4)
var a2 = a1
a2.name="Cat"
//both changed i.e. classes are refrence type(Refrencing the same memory)
a1.name
a2.name

//Properties in classes

//1. Lazy Property
class Test{
    var name:String
    lazy var printName:String = {
        return "Hey \(self.name)"
    }()
    
    init(name: String) {
        self.name = name
    }
    
}

var t1 = Test(name: "Shushant")
t1.printName

//2. Computed Property
class ComputedPro{
    var name:String = ""
    var get_set_name:String{
        get{
            return "Your name is \(self.name)"
        }
        set{
            name = newValue
        }
    }
    
    init(name: String) {
        self.name = name
    }
}
var c1 = ComputedPro(name:"shu")
c1.get_set_name
c1.get_set_name = "Kavya"
c1.get_set_name

// 3. Property Observers
/**
 Property observers let you watch and react to changes in a variable's value.

 You can run some code:

 right before the value changes → willSet

 right after the value changes → didSet
 */

var t:Int = 18{
    willSet{
        "t is about to change to \(newValue)"
    }
    didSet{
        "t is changed to \(oldValue) to \(t)"
    }
}

t = 20


//Inheritance
class Person{
    var name:String
    var age:Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func printDetails() -> String{
        return "Hey this is a person"
    }
}

class S1:Person{
    override func printDetails() -> String {
        return "Hey this is shushant"
    }
}
var per = Person(name:"Person", age:1400)
per.printDetails()
var shu = S1(name: "Shu", age: 20)
shu.printDetails()

// 2 ways
func concat(firstName first:String, lastName lname:String) -> String{
    return "\(first) \(lname)"
}

func concat2(_ fname:String, _ lname:String) -> String{
    return "\(fname) \(lname)"
}

concat(firstName: "Shu", lastName: "Priya")
concat2("Kavya", "Lamba")



//error handling
enum UserError:Error{
    case InvalidEmail
    case InvalidPassword
}

func login(email:String, password:String) throws -> String{
    if email.isEmpty{
        throw UserError.InvalidEmail
    }
    if password.isEmpty{
        throw UserError.InvalidPassword
    }
    return "Login successfull"
}

do{
    try print(login(email: "Profshushant", password: ""))
}catch UserError.InvalidEmail{
    print("Please enter a void email")
}catch UserError.InvalidPassword{
    print("Please enter a valid password")
}



