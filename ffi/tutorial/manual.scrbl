#lang scribble/manual

@title{An introduction to C and the FFI by example}
@author+email["Danny Yoo" "dyoo@hashcollision.org"]


This guide is meant to play a slightly funny role: it's meant to show how
Racket's Foreign Function Interface (FFI) allows us to talk to the ``outside
world''.

At the same time, we'll also introduce core C concepts to those who many not
have seen them before: the intended audience for this guide are folks who may
have just taken their first programming course, and who are now being
introduced to a language like C.



Like many modern languages, Racket tries to play nice by providing an interface
for communicating with C libraries.  In the outside world, the @emph{lingua
franca} is C, and if you're planning to do programming in the future, you'll
probably hit it at some point.


But if you're coming straight from an introductory programming curriculum, you
may have started with a nice, safe language such as Racket.  In this case,
there's a potential confusion that some people take: since Racket is a safe
language, it must therefore be a toy.  Furthermore, there may be a
misconception that everything you learned in your introductory class is useless
because you're not using the language in your other classes.




@section{Getting started}

If you've started with something like HTDP, where Racket has been set to the ...

[The environment]

[Set the language level to professional racket/base]

[installing the tools from PLaneT2]

[Make sure they work]

[Warning warning: C is an unsafe language!  Talk about the potential for
crashing and memory leaking.]

[Getting the C compiler for your platform: Windows, MacOSX, Ubuntu Linux]



[Does this relate to Jay McCarthy's #lang c stuff?] 



@section{Your first C function: Hello World (again)}

@subsection{Accessing @tt{sayHello} with the FFI}



@section{More functions}

[the f2c example]

[I need more examples here to exercise the simple types.  Ints, chars, etc.]




@section{Control flow}



@section{Arrays and basic memory management}



@section{Structures}



@section{Functions that consume functions}



@section{Pointers}



@section{Puns}



@section{Strings}



@section{Structures and Pointers}

[Show the cute trick on how to use pointers to structures to do OOP style in C]




@section{Bit hackery}



@section{A larger FFI binding example}

[What would be interesting to look at, to bind to?  Maybe something like libcrypto?]