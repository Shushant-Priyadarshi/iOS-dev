
//MARK: - odd or even in ranges
func oddEven(n:Int){
    for i in 1...n{
        if i%2==0{
            print(" \(i) is even")
        }
        else{
            print(" \(i) is odd")
        }
    }
}

//oddEven(n: 10)

//MARK: - Array =>
    //1) find sum
    //2) find max and min elements

let arr :[Int] = [23,4,21,54]

//sum
var sum:Int = 0
for i in arr{
    sum += i
}
sum

//max and min
func findMaxAndMin(arr:[Int]){
    var max:Int = arr[0]
    var min:Int = arr[0]
    for i in arr{
        if max < i{
            max = i
        }
        if min > i {
            min = i
        }
    }
    print(min)
    print(max)
}

//findMaxAndMin(arr: arr)

//MARK: - Guest List
    //1) search user by name
    //2) get users less than a certain age
    //3) update RSVP status
    //4) get number of users attenting party
    //5) get the numbers of users not attending party
    //6) print report of age of users,attendess

struct Guest{
    var name:String
    var age:Int
    var RSVP:Bool = false
    
    init(name: String, age: Int, RSVP: Bool = false) {
        self.name = name
        self.age = age
        self.RSVP = RSVP
    }
    
    func printGuestInfo(){
        print("\(self.name) have a age of \(self.age) and the RSVP status is \(self.RSVP)")
    }
    

}

struct GuestList{
    var guests:[Guest]
    
    
    func searchForGuest(name:String) ->Bool{
        for guest in guests{
            if guest.name.lowercased() == name.lowercased(){
                return true
            }
        }
         return false
    }
    
    func getAttendeesLessThan30YearsOld() -> [Guest]{
        var result: [Guest] = []
        for guest in guests{
            if guest.age <= 30 {
                result.append(guest)
            }
        }
        return result
    }
    
//   mutating func updateRSVPStatus(name:String) -> Bool{
//        for guest in guests{
//            guest let idx = guest.name.lowercased() == name.lowercased(){
//                return false
//            }
//           
//            return true
//        }
//    }
    
    func getTotalAttendees() -> Int{
        return guests.count
    }
    
}

let g1 =  Guest(name: "Bruce Wayne", age: 30, RSVP: true)
let g2 =  Guest(name: "Steve Rogers", age: 35, RSVP: true)
let g3 =  Guest(name: "Tony stark", age: 40, RSVP: false)
let g4 =  Guest(name: "Natalya", age: 24, RSVP: false)
let g5 =  Guest(name: "Wanda maximof", age: 405, RSVP: true)
let g6 =  Guest(name: "Kavya Lamba", age: 20, RSVP: true)

var  guestList = GuestList(guests: [g1,g2,g3,g4,g5,g6])

guestList.searchForGuest(name: "kavya")
guestList.getAttendeesLessThan30YearsOld()
//guestList.updateRSVPStatus(name: "Tony stark")
guestList.getTotalAttendees()
guestList


//MARK: - Create product and shopping cart
    //apply discount to items (dollar and percentage)
    //get total cost of products
    //price reciept

struct Product{
    var name:String
    var price:Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
}

struct Cart{
    var items:[Product] = []
    
    func getTotalCost() ->Int{
        var sum:Int = 0
        for item in items{
            sum += item.price
            
        }
        return sum
    }
}

let p1 = Product(name: "Laptop", price: 1000)
let p2 = Product(name: "Mouse", price: 50)
let p3 = Product(name: "Keyboard", price: 150)
let p4 = Product(name: "Headphone", price: 200)
let p5 = Product(name: "Monitor", price: 300)

let shoppingCart = Cart(items: [p1,p2,p3,p4,p5])
shoppingCart.getTotalCost()




