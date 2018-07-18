# Build Your Own Cryptocurreny
* or "why you probably don't need a blockchain"
* John Feminella
* @jxxf

# What money is
* disintermediation?
  * we don't need to exchange a car for wheat, we can use money
* fungibility?
  * exchangable
* resiliency?
  * does it hold up over time?
* measurable?
  * do we agree on a price and how we got to that price?
* debt instrument?
  * can it be used to repay debt?

## Fiat Currency
* run by a central bank or government
* allows transactions to happen
* here, money requires trust in the state or a third party

## A recipe for money
* trust
  * fiat: a stable state government
  * crypto: cryptographic & mathematic code
* rules
  * fiat: laws and regulations around what you can do with money. Expensive to change rules.
  * crypto: software. There is no arbiter to change the transactions.
* history
  * fiat: owned by banks
  * crypto: blockchain, an "interesting data structure, not anything magical"
* details abstracted?
  * fiat: all those details are abstracted from the end user
  * crypto: NOT ABSTRACTED. Room to grow here.

## Let's build a cryptocurrency
* Ledger with common rules
* No overspending
* Everyone must sign each ledger entry
* signing and validating the signatures of ledger entries
  * it's `computationally infeasible` to fake these
* broadcasting changes to the ledger
  * how do we agree on the order of the ledger events? prevents the double spend issue.
  * someone picks an order, organizes it into a block, signs it and then broadcasts that ordering
  * also add a nonce onto the block
* every block must point to the previous block.
* trust the longest chain

## Should you use this?
* can you wait 10 minutes for a database query to complete? probably not.
* is this better than a centralizes database?

## Challenges
* unstable price
* deflationary currency. discourages production.
* Proof of Work is an ecological problematic.   

## Takeaways
* permissionless set of rules
* trustless exchange of value
* it has serious problems
* blockchains have potential if we get things right.
