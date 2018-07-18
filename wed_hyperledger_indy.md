# HyperLedger Indy
* Tracy Kuhrt
* [Slides](https://www.slideshare.net/tkuhrt/oscon-2018-getting-started-with-hyperledger-indy)

# HyperLedger Project
* Within Linux Foundation. Fastest growing project in history of the Linux Foundation.
* HyperLedger is the greenhouse
  * 4 general purpose frameworks
    * Burrow is on the EVM
    * Fabric
    * Indy focuses on decentralized identity
    * Iroha
    * Sawtooth
  * Tools
    * Caliper - benchmarking
    * Cello - deployment
    * Composer - model and build networks
    * Explorer - look at data, explore, duh
    * Quilt - ledger interoperability

## Identity Models
* Centralized Identity
  * most common today.
  * one authority controls and authenticates your data
* Federated Identity: Third Party IDP
  * One identity allows us access to multiple sites
  * "log in with facebook"
  * gives some big power to a few companies
  * they know how we're using all these services
* Self Sovereign Identity (SSI)
  * portable and digital.

## Decentralized Identifiers
* W3C is working on this standard
* A URL that resolves to a DID document
* `did:sov:asd124-123251-sdfsdf3-23sdsdfs`
  * scheme
  * method
  * identifier
* this contains cryptographic information to verify an identity
* you will have many of these to prevent correlation.
* each one is a pairwise-unique pseudonym

## Zero Knowledge Proofs
* one party (the provider) can prove to another (the verifier) that something is true without revealing any other information other than that the statement is true
* Divers License example
  * without it: here's my name, address, date of birth
  * with zero knowledge proof: yes, I am 21.

## Verifiable Credentials
* Todays workflow: verify it isn't a fake id, hand over the entire document
* Blockchain answer:
  * register proof of integrity and provenance
  * present credentials
  * verifier can validate integrity on the blockchain

## Demo Use Case
* British Columbia Government Example

## Open Source Stack
* Built on a cryptographic layer
* A node for identity verification
* SDK is used to build an agent, which has identity solutions on top of them

## Roadmap
* On slides
* Github
* Chat and mailing list
* Weekly meetings
* Wiki
* https://www.hyperledger.org/projects/hyperledger-indy
