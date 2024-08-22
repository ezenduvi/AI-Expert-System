# AI-Expert-System

# Farmer Problem Expert System

## Introduction
This expert system solves the classic Farmer Problem: transporting a farmer, a goat, a wolf, and a cabbage across a river with specific constraints. Developed using Prolog, it leverages logic programming for effective rule and state management.

## System Overview
- **Initial and Goal States:** Defined as `initial_state(state(e, e, e, e))` and `goal_state(state(w, w, w, w))`, representing the starting and desired end conditions.
- **State Transition Rules:** Managed through `rule/1` predicates to specify legal moves between states.
- **Illegal States:** Managed by the `illegal/1` predicate to prevent configurations where the goat is left with the wolf or cabbage without the farmer.
- **Search Strategy:** Utilizes Depth-First Search (DFS) with the `dfs/4` predicate to explore and identify a solution path from the initial to the goal state.

## Implementation Details
- **State Representation:** States are expressed as `state(FP, GP, WP, CP)`, where `FP`, `GP`, `WP`, and `CP` denote the positions of the farmer, goat, wolf, and cabbage, respectively.
- **Transition Rules and `newLocation`:** Rules are defined with predicates like `rule(transport(state(X, X, Wolf, Cabbage), state(Y, Y, Wolf, Cabbage)))` and use `newLocation/2` to manage shore transitions.
- **Illegal States:** Checked using `illegal(state(F, G, W, C))`, ensuring that the goat is not left alone with the wolf or cabbage.

## Depth-First Search (DFS)
- **DFS Algorithm:** Recursively explores state transitions while avoiding illegal states. The algorithm backtracks upon encountering dead ends, ensuring a thorough search for viable paths.
- **Rule Explanation:** Each transition is tracked with a description of the rule applied, such as “Moving from state(e, w, e, e) to state(w, w, e, w) - rule(transport(state(e, w, e, e), state(w, w, e, w)))”.

## User Interaction
- **Running the System:** Execute the `run/0` predicate to load the knowledge base and start the solving process.
- **Displaying Solutions:** Use `display_solution/1` and `display_transitions/1` to show paths and rules applied.
- **Asking for More Solutions:** After displaying a solution, users can choose to see additional solutions by responding to prompts.

## Execution Examples
?- run.
Enter the knowledge base file name: 'knowledgeBase.pl'.
compiling C:/Users/veekt/Desktop/project/knowledgeBase.pl for byte code...
C:/Users/veekt/Desktop/project/knowledgeBase.pl compiled, 20 lines read - 3351 bytes written, 4 ms
Solution Path:
Moving from state(e, e, e, e) to state(w, w, e, e) - rule(transport(state(e, e, e, e), state(w, w, e, e)))
...
Do you want to see another solution? (yes/no): yes.
...
## Principles and Theories Applied
- **State Space Representation:** Models the problem as a graph where nodes are states and edges are transitions.
- **Depth-First Search (DFS):** Explores paths through a graph, suitable for finite state spaces.
- **Backtracking:** Allows exploration of alternative paths after reaching dead ends or illegal states.
- **Rule-Based System:** Encodes logic as rules, providing a declarative approach to problem constraints and transitions.
- **Pattern Matching:** Used for selecting rules based on current state configurations.

## Conclusion
This expert system demonstrates the power of Prolog in solving rule-based problems through state space exploration and logical reasoning. The system effectively navigates constraints to provide viable solutions to the Farmer Problem.
