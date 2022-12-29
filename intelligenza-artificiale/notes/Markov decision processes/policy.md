#intelligenza-artificiale 

In a Markov decision process (MDP), a **policy** is a process that determines what action to take in a given state. It is a mapping from states to actions, indicating what action the agent should take in each state. In other words, a policy defines the behavior of an agent in an MDP.

A policy are deterministic, where it specifies a unique action to take in each state. The goal of an MDP is to find an optimal policy that maximizes some notion of long-term reward. This is typically done using reinforcement learning algorithms, which iteratively improve the policy by learning from the consequences of the actions taken under the current policy.

Policies in MDPs are typically evaluated using the notion of value, which is a measure of how good a given state is for an agent following a particular policy. The value of a state under a policy is the expected long-term reward that the agent will receive if it starts in that state and follows the policy thereafter. The value of a state can be calculated using a dynamic programming algorithm, such as value iteration or policy iteration.

Overall, policies play a key role in MDPs, as they determine the behavior of the agent and can be used to evaluate the performance of the agent in a given environment.

## How to find the optimal policy

**Value iteration** and **policy iteration** are two methods for finding the optimal policy for a given Markov decision process (MDP).

### Value iteration
***
**Value iteration** is an iterative method for computing the optimal values of the states in an MDP. The idea is to start with an initial estimate of the state values, and then to iteratively improve this estimate by one-step lookahead. This means that at each step, the new value of a state is calculated by taking the maximum over all possible actions of the sum of the current state value and the expected future reward of taking that action. This process is repeated until the values of the states converge to a stable, optimal solution.

#### Bellman Update
At each iteration, the value of a state $s$ is updated according to the following equation:

> $V_{t+1}$(s) <- $max_a$ $\sum_{s'} T(s,a,s') [ R(s,a,s') + \gamma * V_t(s') ]$

where $V_t(s)$ is the value of state $s$ at iteration $t$, $T(s,a,s')$ is the transition function that gives the probability of transitioning from state $s$ to state $s'$ when taking action $a$, $R(s,a,s')$ is the reward for transitioning from state $s$ to state $s'$ when taking action $a$, $\gamma$ is the discount factor, and $max_a$ indicates that the maximum value is taken over all possible actions $a$.

#### Policy extraction
To calculate the optimal policy after using value iteration, you can simply use the following equation:

> $\pi^*(s) = argmax_{a} \sum_{s'} T(s,a,s') [ R(s,a,s') + \gamma * V^*(s') ]$

where $pi*(s)$ is the optimal policy at state $s$, $T(s,a,s')$ is the transition function that gives the probability of transitioning from state $s$ to state $s'$ when taking action $a$, $R(s,a,s')$ is the reward for transitioning from state $s$ to state $s'$ when taking action $a$, $\gamma$ is the discount factor, $V^*(s)$ is the optimal value of state $s$, and $argmax_{a}$ indicates that the action that maximizes the expected future reward is selected.

This equation is similar to the one used in policy iteration, but it uses the optimal values computed by value iteration instead of the current value estimates. This will give you the optimal policy for the given MDP.

#### Disadvantages
One disadvantage of value iteration is that it can be computationally expensive, especially for large or continuous MDPs. This is because the algorithm requires multiple iterations over all of the states in the MDP, and each iteration involves calculating the maximum over all possible actions. This can make value iteration impractical for very large or complex MDPs.

Another disadvantage of value iteration is that it can sometimes converge to a suboptimal solution. This can happen if the algorithm gets stuck in a local maximum, where the values of the states are no longer improving but are not yet at the global maximum. In this case, the algorithm will not be able to find the true optimal solution.

### Policy iteration
***
To try to mitigate these problems, there is an alternative method called policy iteration. It works directly on the policy and not on the state-value function. The approach is based on these steps:

1.  Choose an initial policy 𝜋 (random).
2.  Policy evaluation: calculate the values of the state-value function $𝑉^𝜋(𝑠)$ that the policy 𝜋 induces in the MDP (Beware! These will not be optimal values!)
3.  Policy extraction using the values $𝑉^𝜋(𝑠)$ just calculated, extract a new policy 𝜋′
4.  Is the new policy 𝜋′ equal to the old 𝜋?
5.  If yes, the algorithm terminates and returns 𝜋
6.  Otherwise, policy update: replace 𝜋 with 𝜋′ and return to step 2.

Formula for the policy evaluation: 
> $V^\pi(s) = Q(s, \pi(s)) = \sum_{s'} P(s' | s, \pi(s))[R(s, \pi(s), s') + \gamma V^\pi(s')]$

Fundamental property:
- It always ends because the possible policies are finite in number (states and actions are finite)
- The state-value function induced by the policy that the algorithm returns satisfies, by definition, the Bellman equation: it is the optimal policy 𝜋∗.