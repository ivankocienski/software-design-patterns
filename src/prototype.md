# Prototype

A prototype is a way of creating instances of a class by cloning a template object of that class. This can be useful when the template object contains expensive or unique data. This can be used in a factory or a decorator scenario to avoid inheritance or drive run-time selectability.

In some way this is similar to how the ruby language itself operates when instantiating an object: the `class` definitions forms an instance of type `Class` that is then duplicated for each 'instance' of that class. This allows the prototype class to store variables and methods across multiple instances of the same class which is how 'static' methods and members are stored and shared.

## Sample Implementation

A Map with loaded layout data can be used to plot a course from a start location to a finish. The location data can be loaded once and duplicated at run time to speed up IO.
