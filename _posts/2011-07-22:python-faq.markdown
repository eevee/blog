---
categories: reference
tags: python python-faq
date: 2011/07/22 16:50:00
title: Python FAQ
---
I lurk in [#python][].  It gets a lot of questions that are, shall we say, _frequently asked_.  This is my attempt to catalogue interesting and useful questions.  The answers will gradually become separate posts—perhaps on other blogs if someone else gets to them first.  Let me know if there should be other questions, if the answers are unclear, or the answers have bugs in them!

## Variables, operators, and functions

* How do I pass by reference?  Does Python pass by reference or pass by value?
* Why can't I create closures within a loop?
* How do I change a variable in an outer scope?
* How do I access a variable whose name is in a string?  How do I use "variable variables"?
* What does `is` do?  Should I use `is` or `==`?
* Why doesn't division work correctly?
* Why are floats inaccurate?  What type should I use to handle currency?
* How do I test whether a variable is defined?

## Classes, objects, and data

* How do I make a tuple with one element?  What's this trailing comma?
* How do I check what type a variable is?
* Why can't I just do `super(type(self), self)`?  How does `super` work?
* What's the difference between tuples and lists?
* What's the difference between `classmethod` and `staticmethod`?
* How do I make a private attribute?  What's `__foo` do?
* How do I inherit from a built-in class, like `list` or `dict`?
* Why don't my imports work?
* How do I change the value of a global in another module?

## Libraries and the real world

* I only know PHP.  How do I write a Web application in Python?
* How do I parse HTML?
* How do I use a single parameter with the DB-API?
* How do I write a networking application?  How do I use sockets?
* How do I do networking with a GUI?
* How do I use threads?
* How do I write a plugin system?  How do I reload a module at runtime?
* How do I write an IRC bot?

## Security

* How do I store user passwords?  How do I do anything related to encryption?
* How do I supply a password for an SSH connection or `sudo`?
* How do I encrypt my program's source code?

## Bonus question

* What are the worst features in Python?

[#python]: irc://irc.freenode.org/python
