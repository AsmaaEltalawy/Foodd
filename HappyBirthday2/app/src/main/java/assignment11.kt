import android.app.Person
import androidx.compose.ui.text.substring
import androidx.compose.ui.text.toLowerCase
import androidx.compose.ui.text.toUpperCase


//1111111111111111111111111111
//    var x : Int = 5
//    var y : Double = 5.5
//    var z : Char = 'S'
//    var l :Boolean = true
//    println ("int = $x , double = $y , char = $z , boolean = $l")
//   var q = x.toDouble()
//    var k = y.toInt()
//    var w = z.toString()
//    var p = l.toString()
//    println("Double = $q , Int = $k ,String =  $w  ,  String = $p")
    //222222222222222222222222222
//    println("Enter your name ")
//    var name : String = readln()
//    println(name.length)
//    println (name[0])
//    println(name.toUpperCase() )
//    println(name.toLowerCase())
//    println(name.substring(1,5))
//    println("Enter your age ")
//    var stringAge = readln()
//    var age : Int = stringAge.toInt()
//    when {
//        age in 0..12 -> println("Child")
//        age in 13..19 -> println("Teenager")
//        age in 20..64 -> println("Adult")
//        age >= 65 -> println("Senior")
//        else -> println("Invalid age")
//    }

//    println("Enter a number of the day")
//    var stringDay = readln()
//    var day = stringDay.toInt()
//
//    when(day){
//        1 -> print("Saturday")
//        2-> print ("Sunday")
//        3 -> print("Monday")
//        4-> print("Tuesday")
//        5-> print("Wednesday")
//        6 -> println("Thursday")
//        7-> println("Friday")
//        else ->print("Invalid number")
//    }


//    println("Enter the color of traffic light")
//    var color = readln()
//    when(color){
//        "yellow" -> print("Wait")
//        "red" -> print("Stop")
//        "green" -> print("Go")
//        else -> print("Invalid color")
fun main (){

}
open abstract class Employee(var name: String = "", var id: Int = 0) {
    // class members     data field     functions

    init {
        println("Employee")
    }

    constructor(salary: Double, id: Int) : this(id = id) {
        println("Employee")
    }

    open fun display() {
        println("id : $name")
    }

    abstract fun printSalary(): Double
}

class Programmer(name: String, id: Int) : Employee(name = name, id = id) {
    override fun display() {
        println("Programmer")
    }

    override fun printSalary(): Double {
        return 2000.0
    }

}



