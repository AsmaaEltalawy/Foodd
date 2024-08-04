package com.example.happybirthday

import android.os.Bundle
import android.os.Message
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.happybirthday.ui.theme.HappyBirthdayTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            HappyBirthdayTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    Surface (
                        modifier = Modifier.padding(innerPadding),
                        color = MaterialTheme.colorScheme.background

                    ){}



                    }

                }
            }
        }
    }
@Composable
fun GreetingText(message: String,from:String,modifier: Modifier = Modifier) {
    Box {
        Text(
            text = message,
            fontSize = 37.sp,
            lineHeight = 50.sp

        )
        Text(text = from)


    }
}



@Preview(showBackground = true
        , name = "Birthday"
        , showSystemUi = true)
@Composable
fun BirthdayCardPreview() {
    HappyBirthdayTheme {
//        Row {
//            Text("First ")
//            Text("Second ")
//
//        }

     GreetingText(message = "Happy Birthday Asmaa",from = "From Emma")
             }}


