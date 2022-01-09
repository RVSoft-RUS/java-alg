package ru.rvsoft.list

import kotlin.IllegalStateException


object Lists {
    @JvmStatic
    fun main(args: Array<String>) {
        val list: List<Int> = List(1, 2, 3)
        val list2 = list.add(0)
        println(list2)
        val list3 = list.setHead(99)
        println(list3)
        val list4: List<Int> = List()
        println(list4)
        try {
            list4.setHead(4)
        } catch (ex: IllegalStateException) {
            println(ex)
        }

        val list5 = list2.dropAtMost(2)
        println(list5)
        val list6 = list2.dropAtMost(10)
        println(list6)

    }
}

sealed class List<A> { // неявно абстрактный и имеет приватный конструктор
    private object Nil : List<Nothing>() {
        override fun isEmpty() = true

        override fun toString() = "NIL"

        override fun drop(n: Int): List<Nothing> = this
    }

    private class Cons<A>(
        internal val head: A,
        internal val tail: List<A>
    ) : List<A>() {
        override fun isEmpty() = false

        override fun toString() = "[${toString("", this)}NIL]"

        private tailrec fun toString(acc: String, list: List<A>): String =
            when (list) {
                is Nil -> acc
                is Cons -> toString("$acc${list.head}, ", list.tail)
            }

        override fun drop(n: Int): List<A> = if (n == 0) this else tail.drop(n - 1)
    }

    abstract fun isEmpty(): Boolean

    /**
     * Add an element at first position
     */
    fun add(a: A): List<A> = Cons(a, this)

    /**
     * Change element at first position or throw IllegalStateException if list is empty
     */
    fun setHead(a: A): List<A> = when (this) {
        Nil -> throw IllegalStateException("list is empty")
        is Cons -> tail.add(a)
    }

    abstract fun drop(n: Int): List<A>

    fun dropAtMost(n: Int): List<A> = Companion.dropAtMost(n, this)

    companion object {
        operator fun <A> invoke(vararg args: A): List<A> =
            args.foldRight(Nil as List<A>) { a: A, list: List<A> ->
                Cons(a, list)
            }

        tailrec fun <A> dropAtMost(n: Int, list: List<A>): List<A> = when (list) {
            is Cons -> if (n <= 0) list else dropAtMost(n - 1, list.tail)
            is Nil -> list
        }
    }
}