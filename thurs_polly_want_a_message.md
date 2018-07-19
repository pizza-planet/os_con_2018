# Polly Want A Message
* Sandy Metz author of *Practical Object Oriented Design in Ruby*
* "For the first 35 years, I had a day job where I went to my desk and wrote code"
* Then she became a teacher and now she thinks about code.
* She consults and became aware of a pattern of failure in the code.
  * everyone has this problem and that's what this talk is about.

## 1. Design Stamina Hypothesis
* Martin Fowler's theory
* Overdesign line. It slows you down in the start.
* Underdesign line. Late in the project, it'll come back to hurt you.
* It's great in theory, but in real life we have no idea what line we're on.
* We wake up way out here where productivity has hit zero. Ouch.

## 2. Procedural OO code
* Simple procedure - easy to changes
* OO with right indirection - starts to get harder
* Complex Procedures become hard to impossible to maintain
* Only thing worse: OO with bad abstractions
* "Faux-O" code - added levels of indirection on complex procedures to punish the maintainers

# 3. File Churn and Complexity
* Michael Feathers
* Churn - the number of commits to a file
* Complexity
* complex code shouldn't change much and changes should be small and simple

## So... Code Climate on OSS Projects
* Angular: 1.8 GPA has a low C
* Discourse: 2.58 GPA
* Gitlab: 2.97 GPA
* You know the class that's at worse complexity and high churn

## DEATH STAR ANTI PATTERN
* Bigger than average
* Full of conditionals
* incomplete tests
* No one wants to work on them
* They're the most important class in your domain
* Don't feel bad. This happens to everyone.

# What happened?
* 1-3 happens in order. We miss the big refactors.
* What matters, suffers.
* Example
  * Add code snippets by file
  * by git tag
  * some lines
  * code lines or comments
  * raw or left justified
* Execution paths keep growing

> "What brought you success will doom you to failure"

* "Having totally depressed you now, let's talk about doorknobs."

## Affordances
* A Door knob's self-evident design is an affordance
* "Pull" sign is text to fix a design error
* Push and Pull plates on one way doors

## OO Affordances
* As one sentence...
* Anthropomorphism
  * attribution of human qualities to non human things
* Polymorphism
  * "many forms"
  * Many objects of different types that respond to the same API
  * something we don't really understand but use to intimidate each other. =)
* Loosely-Coupled
  * Each thing could easily let go.
  * Tightly coupled binds us into a certain relationship
* Role playing
  * objects are players of their roles than instances of their type
  * repeat of polymorphism, replaceable with some variability
* Factory Created
  * factories hide the rules for picking the right player of a role
  * hide a conditional
  * separate the object that is chosen from its functionality
* Message Sending
  * I know what I want, you know how to do it
  * OO is just message-sending architecture

## Execution Branches
* cartesian product of your conditional branches and why your tests aren't good enough

# Refactor
* Instead of decency injection, come up with a role with a polymorphic relationship called `Source`
* Isolate the things you want to vary. Role player. Ask the source for its lines.
* Cuts the execution paths in half!
* Push conditionals back in the stack. Put them in one place.
* What is the name of this? That's the hard part... `Subset`
  * Subset everything is as important as any other subset
* Inject smart things. Instead of handling conditional injections everywhere.
* Only ONE execution path. No conditionals.
* 9 classes instead of 1, but all smaller than 10 lines.
