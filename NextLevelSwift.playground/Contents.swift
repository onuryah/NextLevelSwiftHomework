import UIKit

//         STRUCT
struct AraclarStruct{
    var tekerSayısı : Int
    var koltukSayısı : Int
    var type : String
    

    mutating func kazaYapStruct(){
        tekerSayısı -= 1
    }
}

class AraclarClass{
    var tekerSayısı : Int
    var koltukSayısı : Int
    var type : String
    
    func kazaYapClass(){
        tekerSayısı -= 1
    }
    
    
    init(tekerSayısıInput : Int, koltukSayısıInput : Int, typeInput : String){
        tekerSayısı = tekerSayısıInput
        koltukSayısı = koltukSayısıInput
        type = typeInput
        
    }
}

var sedan = AraclarStruct(tekerSayısı: 4, koltukSayısı: 5, type: "sedan")
var pickUp = AraclarClass(tekerSayısıInput: 4, koltukSayısıInput: 4, typeInput: "pickUp")

sedan.kazaYapStruct()
pickUp.kazaYapClass()

//print(sedan.tekerSayısı)
//print(pickUp.tekerSayısı)

//Fonksiyonlar çalışır ve sedan'ın ve pickUp'ın teker sayıları 1 azalıp 3 olur.


//         REFERANCE AND VALUE

var copyOfSedan = sedan
var copyOfPickUp = pickUp
//Kopyalar üretildi.

copyOfSedan.kazaYapStruct()
copyOfPickUp.kazaYapClass()
//Kopyalar, kazaYap fonksiyonlarını Inheritance aldığı için fonksiyonlar çalıştı.

//print(copyOfSedan.tekerSayısı)
//print(copyOfPickUp.tekerSayısı)
//Kopyalardan beklendiği gibi teker sayısı 2 oldu.

//print(sedan.tekerSayısı)
//print(pickUp.tekerSayısı)
//sedan'ın 3, pickUp'ın 2 tekeri olduğu görülür.
//Çünkü Structlar kopyaları için de Value oluştururken, Classlar bir Value daha oluşturmazlar. Bunun yerine ilk değerin Referance'sini oluştururlar. Yani bu örnekte Struct kendisi ve kopyası için 2 Value bulundururken, Class 1 Value ve 1 Referance bulundurur. Bundan dolayı Class değişkeni kopyası değiştiğinde, Class değişkeni de değişir.



//         RETURN
func sumTwoNumber(firstValue : Int, secondValue : Int) -> Int{
    return firstValue + secondValue
}
sumTwoNumber(firstValue: 6, secondValue: 11)




//func sumTwoNumbersWithoutReturn(firstValue : Int, secondValue : Int) -> Int{
//    print(firstValue + secondValue)
//}
// It give error. Because while making a func if you use "->", you must return your func.



func sumTwoNumbersWithoutReturn(firstValue : Int, secondValue : Int) -> Int{
    return firstValue
    return firstValue + secondValue
}

sumTwoNumbersWithoutReturn(firstValue: 43, secondValue: 34)
//First written return returns!



//           TUPLE

var myTuple = (1,2,3)
//print(myTuple)
//print(myTuple.1)
//Görüldüğü üzere 1. indexteki değeri print ediyor.

myTuple.2 = 14
//print(myTuple.2)
//Tuple, var ile kurulduğu için değeri değiştirilebilir.

var myTurple2 = (true, 2, [1,3], "Onuralp")
//print(myTurple2.2[1])
//Farklı typelerı toplayabilir ve istediğimiz değerleri sırasına göre çekebiliriz.

var myTurple3 = (altın : "Degerli maden", bakır : false, gümüş : 3)
//print(myTurple3.bakır)
//Dicrionary şeklinde kaydettiğimizde index olarak değil de key olarak çağırıyoruz.




//         GUARD LET vs IF LET

var myNumber = "23"

func guardMakeIntegerFromString (value : String) -> Int {
    guard let myNumberInt = Int(value) else {
        return 0
    }
    return myNumberInt
}
//print(guardMakeIntegerFromString(value: "87"))
//print(guardMakeIntegerFromString(value: "apple"))



func ifMakeStringFromInteger (value : String) -> Int {
    if let myNumberInt = Int(value){
        return myNumberInt
    }else {
        return 0
    }
}
//print(ifMakeStringFromInteger(value: "56"))
//print(ifMakeStringFromInteger(value: "water"))


//         REMANDER

func remanderCalculate(value : Int){
    let remander = value % 4
if remander == 1{
    print("Kalan 1' dir.")
} else if remander == 2 {
    print("Kalan 2'dir.")
}else if remander == 3{
    print("Kalan 3'tür.")
}else{
    print("Tam bölünür")
}
}
//remanderCalculate(value: 7)
//Girilen sayının 4 ile bölümünden kalanı bulan fonksiyon çalışıyor.



/*
 var remanderValue = 47 % 13
if myNum == 1...4{
} else if myNum == 5...8 {
    
}else if myNum == 9...12{
    
}else{
    
}
 */
//If kontrol ile range yazılamaz, hata veriyor.



/*
var remanderValue = 47 % 12
switch remanderValue{
case 1...4:
    print("Kalan 1-4 arasındadır.")
case 5...8:
    print("Kalan 5-8 arasındadır.")
case 9...11:
    print("Kalan 9-11 arasındadır")
default:
    print("Tam bölünür.")
}
// SONUÇ : Kalan 9-11 arasındadır.
 */
 
//Switch ve case kontrol ile range yazılabilir.




//            PROTOCOL

protocol OverClock{
    var canOverCLock : Bool {get}
    func isOverClockable()
}
//Protocol tanımlandı.


struct Gpu : OverClock{
    var canOverCLock: Bool
    
    func isOverClockable() {
        if canOverCLock == true{
            print("Overclockable!")
        } else {
            print("Not Overclockable!")
        }
    }
    
    var name : String
    var old : Int
    var power : Int
}
//Protokol kullanılarak Struct oluşturuldu. Protokolde tanımlanan değişken ve metod eklenilmezse hata vereceği için eklenildi.



class Cpu : OverClock{
    var canOverCLock: Bool
    
    var name : String
    var old : Int
    var power : Int
    
    func isOverClockable() {
            if canOverCLock == true{
                print("Overclockable!")
            } else {
                print("Not Overclockable!")
            }
    }
    
    init(nameInput : String, oldInput : Int, powerInput : Int, canOverClockInput : Bool){
        name = nameInput
        old = oldInput
        power = powerInput
        canOverCLock = canOverClockInput
    }
}
//Protocol kullanarak Class oluşturuldu. Protokolde tanımlanan değişken ve metod eklenilmezse hata vereceği için eklenildi.



let nvidia = Gpu(canOverCLock: true, name: "Nvidia", old: 20, power: 90)
//nvidia.isOverClockable()


let Intel = Cpu(nameInput: "Intel", oldInput: 20, powerInput: 80, canOverClockInput: false)
//Intel.isOverClockable()

//Struct ve Class yapılarında Protokol ile tanımlanan değişkenler çalıştı!

class I7 : Cpu {
}
let i7FifthGen = I7(nameInput: "i7", oldInput: 10, powerInput: 90, canOverClockInput: false)
//i7FifthGen.isOverClockable()
//Cpu Class'ı oluşturulurken Protokol kullanılmıştı. I7, CPU'dan Inheritance aldığı için değişkenler ve metod tanımlı olarak gelmektedir.




//           CLOSURE

func sum(firstInput : Int, secondInput : Int) -> Int{
    return firstInput + secondInput
}
sum(firstInput: 7, secondInput: 45)


func calculate(firstInput : Int, secondInput : Int, myFunction : (Int,Int)->Int) -> Int{
    return myFunction(firstInput,secondInput)
}
//Fonksiyonu herhangi bir işleme tabi olmadan oluşturdu. firstInput ve secondInput'a konulacak olan değerlere myFunc metodu uygulayarak sonuca ulaşılacak. Yazılacak myFunc (Int,Int)->Int yapısına uygun olmak zorunda.

calculate(firstInput: 21, secondInput: 43, myFunction: sum)

/*
{(num1 : Int, num2 : Int)->Int in
    return num1 * num2
}
*/

calculate(firstInput: 6, secondInput: 4, myFunction: {(num1 : Int, num2 : Int)->Int in
    return num1 * num2
})

calculate(firstInput: 6, secondInput: 4, myFunction: {(num1, num2)->Int in
    return num1 * num2
})

calculate(firstInput: 6, secondInput: 4, myFunction: {(num1, num2) in
    return num1 * num2
})

calculate(firstInput: 6, secondInput: 4, myFunction: {(num1, num2) in num1 * num2
})

calculate(firstInput: 6, secondInput: 4, myFunction: {$0 * $1})

//Görüldüğü gibi yukarıda verilenlerin hepsi aynı anlama gelmektedir.
