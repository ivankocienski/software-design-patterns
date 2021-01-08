# Observer

Have one subject object notify another listener object when something happens to the subject. A typical example may be to hook into a Button widget (subject) with a 'click' event listener. The Button does not need to know anything about event listeners and the event listener does not need to know anything about its event sources. In this manner the subject (Button) and the listener are weakly bound.

## Sample implementation

A doctor sees many patients for check-ups. For bookeeping purposes they must track how many check-ups they have performed. Instead of having the doctors specifically track this number- a 'checkup' event can be subscribed to. As long as the doctor sends out a notification of a check-up the observers can update their state accordingly.
