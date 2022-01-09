package ru.rvsoft.list


object Lists {
    @JvmStatic
    fun main(args: Array<String>) {

    }
}

sealed class List<A> {
    internal object Nil : List<Nothing>()
    internal class Cons<A>(
        private val head: A,
        private val tail: List<A>
    ) : List<A>()
}