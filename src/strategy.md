# Strategy

A class that can have its behaviour change at run time. By forming a class that delegates the processing of data to a client-selectable algorithm module/class the user can select how the data is processed in a container agnostic manner. This means the containing class is much easier design and a number of complex processing algorithms can be tucked away in helper modules, separating concerns.

## Sample Implementation

When analysing a dataset a user can load the data into an object-instance and select which algorithm the dataset processor should use.
