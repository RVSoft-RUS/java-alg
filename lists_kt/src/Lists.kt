package ru.rvsoft.list

import java.lang.IllegalStateException


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
        list4.setHead(4)
    }
}

sealed class List<A> { // неявно абстрактный и имеет приватный конструктор
    private object Nil : List<Nothing>() {
        override fun isEmpty() = true

        override fun toString() = "NIL"
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
    }

    abstract fun isEmpty(): Boolean

    fun add(a: A): List<A> = Cons(a, this)

    fun setHead(a: A): List<A> = when(this) {
        Nil -> throw IllegalStateException("list is empty")
        is Cons -> tail.add(a)
    }

    companion object {
        operator fun <A> invoke(vararg args: A): List<A> =
            args.foldRight(Nil as List<A>) { a: A, list: List<A> ->
                Cons(a, list)
            }
    }
}