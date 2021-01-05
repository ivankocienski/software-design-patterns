# Flyweight

The flyweight pattern distributes complex shared state amongst a number of objects that depend on that state to perform their duties. This allows the shared state to be loaded or computed only once. The state may represent a considerable amount of resources and would be burdensome to duplicate many times. The dependent objects can then perform their task specialising the use of the shared state. The shared object can be frozen to avoid mutation.

The canonical example would be a GUI library that shares a font object amongst the many widget instances. The widgets can use the shared font without duplication and the font object can employ a cache of expensive data.

## Sample Implementation.

In a traffic simulation for a big city many thousands of vehicle objects may be instantiated to simulate road usage and see where traffic problems are likely to arise. There are a number of vehicle types: car, truck and motorbike. As the simulation runs each instance of a vehicle will be asked to produce a plan (for its journey). To generate this plan the vehicle object needs to employ a model of the city. This "route" model is likely to involve a lot of state describing the connected graph of roads in the city and so the flyweight pattern is employed to load the city route model once and share it amongst the many vehicles during a simulation run.

