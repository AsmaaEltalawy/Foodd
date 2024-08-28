package com.example.posts

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase

@Database(entities = [Post::class] , version = 1)
abstract class PostsDataBase : RoomDatabase() {
    object DataBaseBuilder{
        fun getInstance(context :Context):PostsDataBase{
            val db = Room.databaseBuilder(context.applicationContext,PostsDataBase::class.java,"post_db")
                .build()
        return db}
    }
}