# Memento

The memento pattern is a method of capturing the state of an object in a black-box snapshot. As the client performs actions on the provider object they can create restore points as the procede. At a later time the snapshots can be used by the client on the provider to restore its internal state. The generic example is that of a text-editor that keeps an undo-history that can be invoked to restore the document back to some historical point.

## Sample Implementation

A simple game board that can snapshot its current state is presented. As moves are made a snapshot is kept. Once all the moves have been made the sample then un-does the game board move by move. The client has no notion of what is inside the snapshots. In this example the entire board is duplicated every time (which is a little inefficient). A better implementation would capture only the delta differences. Another short-coming of this implementation is that there is no oversight as to how the snapshots are restored and a snapshot can be applied many times.
