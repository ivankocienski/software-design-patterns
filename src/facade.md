# Facade

Streamline the behaviours of a complicated class (or classes) behind a simplified class that describes a common usage pattern. 

# Sample implementation

An HTTP request can be configured in many differing ways exposing the flexible nature of the protocol. There is the Request, the URL, the HTTP interaction and the Response that all need to be set up correctly.

So a simple class `GetPage` does all of this fiddly work behind the scenes to give the consuming programmer a simple 'just get the http page and run my code' object. The class sacrifices the flexibility of the existing API for 'doing one thing well'.
