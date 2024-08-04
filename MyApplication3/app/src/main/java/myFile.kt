package  com.example.myapplication

import java.util.Scanner

fun main(){
//    println("Asmaa")
//    var x = 5
//    var y : String = "Asmaa"
//    var g = 10
//    println("sum = ${x+g}")
//    println(y)
//
//    print(1.times(5))
//    if (x in 0..10){
//        print ("Hello")}
    print(" Enter you score")
    val reader = Scanner(System.`in`)
    val score = reader.nextInt()
    when(score){
        in 90 ..100 -> print("A")
        in 80 ..89 -> print("B")
        in 70 ..79 -> println("C")
        in 60 ..69 -> println("D")
        in 0 ..59-> print("E")
        else -> println("invalid")


    }

}