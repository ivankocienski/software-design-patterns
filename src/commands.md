# Commands

Using a class to define a complex action that can be initialised with all dependent parameters and passed into other methods/objects who don’t care about the commands internal configuration. An example of this would be in the C++ Qt library a menu option has an Action object so when the user selects “save” from the menu the “save” action is invoked without the menu needing to know what the action is doing. This also allows hot-keys to be defined and trigger the same action object so F5 will also invoke the “save” action.

Using this approach allows code separation between (a) the thing being modified, (b) the interface object the user interacts with and (c) the complexity of this modification.


## Scenario

A simple bank account for buying and selling (securities) is implemented.

- `Account`: the receiver target for the command.
- `BuyOrder` and `SellOrder`: the Command object instance representing a subclass of `OrderCommand`.
- `Transaction`: the Command dispatcher that invokes the order on the account.

