# State

The state pattern is employed to manage objects that have a complex code path with multiple sub-algorithms. It is like a State Machine but can be simpler. One state based object will have multiple helper classes that lift complex processing and checking logic into manageable units. This greatly simplifies the originating control object.

## Sample Implementation

A HTTP response solution is presented. The HTTP response format has three basic sections: preamble, headers and body. HTTP responses can also be badly formed. The complexities of parsing the sections correctly falls to the specific state classes and the HTTPParser itself has relatively simple code paths (these could be made simpler still by use of mixins to provide the state management). 

In this sample one document is well formed and the next is badly formed. The HTTPParser does not need to know if it should keep processing a response and leaves all the decision making for the state classes.
