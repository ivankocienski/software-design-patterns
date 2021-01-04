# Singletons

A special class that has only one instance that is retrieved and re-used. For example a remote connection to a database in a web application may want to get the connection object for every request but have only one connection instance. In Ruby this can be done either with a class with a static method to instantiate and/or retrieve the object or by employing a module. 

This pattern is used to take complex state out of the global namespace and provide an OO like black box interface with clean method APIs.

The first implementation uses a class proper to hold state and is accessed through a public class helper function. State is set up in the constructor.

The second implementation uses a ruby module to form a namespace. It does not need a get method  as modules have only one binding. The local state of the module is hidden from the end user.

## Other examples
Ruby uses singletons extensively internally to deal with atomic data types like numbers, booleans and keywords. They also form the basis of ruby's class system as classes are instances of a meta object. When a class is instantiated it maintains a pointer to this object through the `.class` method. This is how static methods and values are stored.
