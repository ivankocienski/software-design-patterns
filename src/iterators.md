# Iterators

Iterator objects are used to enumerate values in a container. An iterator is instantiated with a container and a pointer and then the end-user loops over the values. The iterator is responsible for checking when it has completed. The end-user loop just has to set up the iterator and test if it has more work to do.

Note: In ruby the iterator pattern is used extensively on containers like array, string or hash-tables. It has a much cleaner interface for the most common types of iteration.

This implementation uses a specific class to iterate. It might be a useful pattern if the end user wanted to re-start iterators mid flight.
