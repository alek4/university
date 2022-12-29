#intelligenza-artificiale  #code-example

```python
import numpy as np

# Set of states
states = ["Rainy", "Sunny"]

# Set of actions
actions = ["Stay Inside", "Go Outside"]

# Transition probabilities
transition_probs = {
    "Rainy": {
        "Rainy": 0.7,
        "Sunny": 0.3
    },
    "Sunny": {
        "Rainy": 0.4,
        "Sunny": 0.6
    }
}

# Rewards
rewards = {
    "Rainy": {
        "Stay Inside": 2.0,
        "Go Outside": 0.0
    },
    "Sunny": {
        "Stay Inside": 1.0,
        "Go Outside": 3.0
    }
}

# Discount factor
gamma = 0.8

# Helper function to look up action values
def get_action_value(state, action):
    return rewards[state][action] + gamma * sum(transition_probs[state][next_state] * value_table[next_state] for next_state in states)

# Policy
policy = {
    "Rainy": "Stay Inside",
    "Sunny": "Go Outside"
}

# Value table
value_table = {
    state: 0.0 for state in states
}

# Value iteration
while True:
    # Store old value table
    old_value_table = value_table.copy()

    # Update value table
    for state in states:
        # Get the action with the highest value
        action = max(actions, key=lambda action: get_action_value(state, action))

        # Update the policy for the current state
        policy[state] = action

        # Update the value for the current state
        value_table[state] = get_action_value(state, action)

    # Check for convergence
    if np.allclose(old_value_table, value_table):
        break

# Print final policy and value table
print(policy)
print(value_table)
```

In this example, there are two states ("Rainy" and "Sunny") and two actions ("Stay Inside" and "Go Outside"). The transition probabilities and rewards are defined in the `transition_probs` and `rewards` dictionaries. The `value_table` is initialized with zeros and is updated using the value iteration algorithm. The `policy` dictionary is updated to reflect the optimal action to take in each state. Finally, the final policy and value table are printed.

This MDP could represent a decision-making scenario where the agent (e.g. a person) must decide whether to stay inside or go outside on a rainy or sunny day. The rewards and transition probabilities can be modified to reflect different preferences and scenarios. For example, the reward for staying inside on a sunny day could be increased to encourage the agent to go outside more often.