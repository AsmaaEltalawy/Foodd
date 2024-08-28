package com.example.posts

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.Query
import androidx.room.Update

@Dao
interface PostDao {
@Query("select * from posts_table")
    fun getPost():List<Post>

@Delete
    fun deletePost(post: Post)

@Insert
    fun insertPost(post: Post)

@Update
    fun update(post: Post)
}