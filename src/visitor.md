# Visitor

A way of separating complex data structures from complex algorithms. A source object is loaded and then an operator class is instantiated referencing the source. This way the algorithm in the operator class can be changed, extended or refactored and the underlying data structure will remain untouched.

## Sample Implementation

In a stock trading simulation models need to analyse a security's history. Many stocks and many models exist. By separating the data from the algorithm a much more flexible analysis can be performed.
