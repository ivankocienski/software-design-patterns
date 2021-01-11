# Composite

A composite pattern is a storage strategy for holding objects of differing types in an array and iterating over them as if they were the same type. This is trivial to do in ruby as it has dynamic typing and as long as the objects respond to the same method calls no problems will arise. This is typically used in tree-like data structures where nodes can either be a single entity or a collection of other nodes.

## Sample Implementation

A widget library has a layout defined by a tree. Each node on the tree can be either a Widget or a Collection (representing a group of widgets). When the widget tree is defined it is iterated over by a simple `widgets.each` construct. The iterator has no notion of what specific type of object it is calling in to but still prints out the tree to the console.
