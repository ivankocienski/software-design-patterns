# Factory

A Factory is a way of instantiating an object of a class using code that is external to the class. By extracting the object construction logic the product class will be smaller and have a tighter focus on its intended purpose. This also means the factory can be quite complex on its own or many factories can exist for one product-class that can provide different logic for the end-user. By doing so the product-class will have no awareness or concern about how it was constructed.
An example could be a user interface library that has a complicated widget set allowing nested widgets with parameters of various kinds. A Factory could be implemented that accepts XML input and produces a widget tree object. By using a factory the widget code can focus on performing user interface duties leaving the validation, construction and parenting to the factory. This also means that a new factory that takes JSON as input can be implemented without having to modify any of the widget code.

## Sample Implementation

A car has many components and properties. The construction of a car object is therefore non-trivial. A factory is provided that takes a "car definition" structure and returns an object with the desired field values. Note how simple the Car and Component classes are and also the user code.
