#intelligenza-artificiale

A [[Markov]] decision process (MDP) is a mathematical framework for modeling decision-making problems with probabilistic outcomes. It is a type of discrete-time stochastic control process, which means that it provides a formalism for describing a decision-making problem in which the agent has to make a sequence of decisions over time, and the outcomes of these decisions are probabilistic.

An MDP is typically defined by a tuple $(S,A,P,R,\gamma)$, where $S$ is a set of states, $A$ is a set of actions, $P$ is the state transition probability matrix, $R$ is the reward function, and $\gamma$ is the discount factor. The elements of the tuple are defined as follows:

-   $S$ is a set of states that represent the different possible configurations of the environment. For example, in a grid world, the states might represent the different positions of the agent on the grid.
    
-   $A$ is a set of actions that represent the different possible choices that the agent can make at each state. For example, in a grid world, the actions might include moving up, down, left, or right.
    
-   $P$ is the state transition probability matrix, which defines the probability of transitioning from one state to another given an action. For example, if the agent is in state $s$ and takes action $a$, the probability of transitioning to state $s'$ is given by $P_{s,a,s'}$.
    
-   $R$ is the reward function, which defines the immediate reward that the agent receives after transitioning from one state to another. For example, if the agent is in state $s$ and takes action $a$, the reward that the agent receives after transitioning to state $s'$ is given by $R_{s,a,s'}$.
    
-   $\gamma$ is the discount factor, which determines the importance of future rewards relative to immediate rewards. It is a value between 0 and 1, where a larger value of $\gamma$ means that the agent is more concerned with maximizing long-term reward, whereas a smaller value means that the agent is more concerned with maximizing immediate reward.

The goal of an MDP is to find an optimal [[policy]], which is a process that determines what action to take in a given state in order to maximize some notion of long-term reward. This is typically done with dynamic programming, that breaks down the problem in smaller and easier subproblems, this method applies to problems for which is valid the [[Bellman optimality principle]].

Overall, an MDP provides a formalism for modeling decision-making problems with probabilistic outcomes, and it can be used to find optimal policies that maximize long-term reward. It is a widely used framework in artificial intelligence, particularly in the field of reinforcement learning.

## Example 

An example of a Markov decision process (MDP) is a simple grid world, where an agent must navigate from a starting position to a goal position while avoiding obstacles. The MDP is defined by the tuple $(S,A,P,R,\gamma)$, where $S$ is the set of states, $A$ is the set of actions, $P$ is the state transition probability matrix, $R$ is the reward function, and $\gamma$ is the discount factor.

The set of states $S$ in this example would be the set of all possible positions on the grid, including the starting position, the goal position, and any obstacles. The set of actions $A$ would be the four possible actions that the agent can take at each state: moving up, down, left, or right.

The state transition probability matrix $P$ would define the probability of transitioning from one state to another given an action. For example, if the agent is in state $s$ and takes action $a$, the probability of transitioning to state $s'$ is given by $P_{s,a,s'}$. In this example, the probabilities would be determined by the layout of the grid, with some transitions being impossible (e.g. moving off the edge of the grid) and some transitions having a probability of 0 (e.g. moving into an obstacle).

The reward function $R$ would define the immediate reward that the agent receives after transitioning from one state to another. For example, if the agent is in state $s$ and takes action $a$, the reward that the agent receives after transitioning to state $s'$ is given by $R_{s,a,s'}$. In this example, the rewards could be defined as follows:

-   The agent receives a small positive reward (e.g. +1) for each step it takes towards the goal.
-   The agent receives a large positive reward (e.g. +10) when it reaches the goal.
-   The agent receives a small negative reward (e.g. -1) for each step it takes away from the goal.

The discount factor $\gamma$ determines the importance of future rewards relative to immediate rewards. In this example, a value of $\gamma = 0.9$ might be used, indicating that the agent is concerned with maximizing long-term reward but still values immediate rewards.

The goal of this MDP would be to find an optimal policy that tells the agent what action to take at each state in order to maximize its long-term reward. This could be done using reinforcement learning algorithms, which iteratively improve the policy by learning from the consequences of the actions taken under the current policy.