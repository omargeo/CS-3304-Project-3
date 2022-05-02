# CS-3304-Project-3

Solving the bridge crossing bridge crossing (https://en.wikipedia.org/wiki/Bridge_and_torch_problem) problem. 
This is a classic problem solving problem that prolog is ideally suited to handle.

Basic algorithm
We will assume that everyone is on the left side of the bridge and they are trying to get to the right side of the bridge. This means once the left side of the bridge is empty we have gotten everyone across, assuming of course we haven’t exceeded our time limit.

I have two helper predicates, one to go from the left side to the right side and one to from the right side to the left. They both follow the same basic idea but when we go from right to left we only need a single walker.

This is my basic plan for going to the right

  - If I have time left
  - Pick two walkers
  - Determine which walker’s time is slower
  - Update my time remaining
  - Add to my plan
  - Updated where every one is
  - Call the helper to go the other way.
When I go to the left, I do more or less the same thing, but I only need 1 walker and so therefore I don’t need to determine which walker is slower in that case, I simply use the walker I picked time.
