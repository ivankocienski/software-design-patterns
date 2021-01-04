# Singletons

A special class that has only one instance that is retrieved and re-used. For example a remote connection to a database in a web application may want to get the connection object for every request but have only one connection instance. In Ruby this can be done either with a class with a static method to instantiate and/or retrieve the object or by employing a module. 

This pattern is used to take complex state out of the global namespace and provide an OO like black box interface with clean method APIs.

The first implementation uses a class proper to hold state and is accessed through a public class helper function. State is set up in the constructor.

The second implementation uses a ruby module to form a namespace. It does not need a get method  as modules have only one binding. The local state of the module is hidden from the end user.
