# Proxies

Wrap an inner object in an outer object to augment functionality or simplify the inner object interface.

Proxies can also be used for forwarding control from one system to another remote system by network API. Another example would be for using expensive resources such as audio/video files that need to be streamed off disk in workable chunks but the calling code would want to treat these resources like a regular file.

## Sample code

A `Lock` can be opened- however it has no security. By wrapping the `Lock` in a `Crypto` object and proxying calls to the `Lock` through the `Crypto` object we can test if the provided `User` object has the correct key without modifying the `Lock` code.


