# Decorator

A way of extending the behaviour of a single instance of an object by wrapping it in a decorator object. Neither the original source object or the client code have awareness the source object has been decorated. Decorators can be chained to combine behaviour. 

Decorators can be employed to provide small well-defined features that are only needed on specific objects. This can happen at compile time or at run time. 

*Delegates:* Unlike the delegate pattern; decorators are a way extending the behaviour of an object without the objects awareness.

*Proxies:* Unlike the proxy pattern; a decorator should only have a very narrow behaviour. A Proxy can represent a very complex abstraction.





## Sample Implementation

A pet class is defined that has a "speak" behaviour. A number of decorator classes are implemented allowing specific objects to change their speak behaviour at run time. These decorators can be chained. The original object can be modified and all decorators that use that same object will have those updates.
