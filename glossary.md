# Glossary

**OO** object oriented programming. Collecting data structure and code to manipulate said data in an opaque interface.

**FP** functional programming. FP focuses more on functions as the core programming concept as opposed to opaque classes. Common algorithms take data as input with a callback function that can provide specialisation.

**Instantiation** allocating and initializing memory using a class described by the compiled code.

**Class** description of data structures and methods as defined by code that can be compiled and instantiated.

**Object, instance** A piece of memory in a running application built from a class definition. Methods in the class are invoked blindly by the user and the method code runs in the binding context of the object.

**Mutable/immutable** Whether a code entity can change values in its binding context. Mutable objects can change their state and immutable objects cannot and must be copied/updated for every state change.

**Intrinsic** A function (or class) in a language that implements some core functionality or platform dependent abstractions. An example in ruby would be the basic set of built in types: string, integer, array. These classes do not need to be loaded as they are implemented in the core language and ruby would not be able to operate without them present. Another example are the set of `built-in` functions in Common Lisp that the compiler needs to execute the language runtime.

**Invariant** Constrain a value to a finite set of values. This can be fixed static values defined at compile time or object state fields. An example of this is a `Date` class that constrains the `day` which is an integer to the values 0 > n > 31. In some languages (like C++) this behaviour can be implemented by using `assert` macros.

**Value object** A value object is a way of defining custom types programmatically. At run time two value objects can be compared based on their internal value and not by the object address pointer. Value objects should be immutable although they do not need to be singletons. In ruby the Integer class has value object properties- the programmer can compare `X` with `Y` and if both `X` and `Y` have value object of 123 then `X` and `Y` are the same "value".

**Design by contract, Contract programming** An approach to designing how software works by following a well defined template covering all the stages of the software algorithm. This definition can then be used as a basis for testing the algorithm and documentation describing explicitly what the algorithm needs as input and how its output will be returned. This can also describe entire classes and libraries of classes. The "contract" defines inputs and outputs and if either the caller or the callee deviate from the contract definition it is considered breaking the contract.

**Domain Driven Design** An approach to software modelling where a project/component is defined by Domain Experts. This allows the developers to build a common language used to describe the problem domain. E.g. A nuclear reactor control software team must know all the terminology used in the nuclear power plant industry. This knowledge can be captured in glossaries or theory-of-operation documents. Then the software team can incorporate that language and grammar into the software artefact and when it is delivered it will be assimilated into the clients' environment with less resistance (so it will be easier to train nuclear reactor engineers who will be using the software).
