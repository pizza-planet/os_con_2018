# What Worker for (Netflix) May Not Work For You
* Subbu Allamaraju / @sallamar

# Expedia
* 75 Countries, 93 Currencies, 67 Languages
* 600M+ MAU*
* 750 million searches per day
* 9 billion pricing and inventory updates every day
* 15 Billion flight searches annually
* The fun is in how we get this infrastructure into the cloud without downtime for the business

# The typical recipe
* Culture
* Replatform so you don't take the same debt into the cloud
* Microservices, K8S
* CI
* Service Discovery, service mesh

## The Map
* The cloud native map from [cncf.io](https://www.cncf.io/)

## His journey
* invest to drive rate of change
* know the landscape
  * monoliths, microservices, dependencies
  * stateless monoliths
    * shared hairball code
    * one release train
    * some parts cannot move faster
  * stateful monoliths
    * large shared database
    * centralized and a low rate of change

# One Size Does Not Fit All
* New services are ready!
* lift and shift - low pain, lower gain, low motivatio
* deprecate - time to get rid of it entirely
* replatform - untagle it all. it's painful.
* move and tune - move quick, tune iteratively (his favorite)

# Cloud Native Is...
* embracing the new ecosystem. 39 AWS services.
* internalize cloud economics. cloud is cheap if you control and measure it.
* operating securely even with change rate

# Guardrails
* automate everything
* practice finance governance
* comply to controls
* implement fault domains

# Lessons Learned
* organic migrations don't work. Focus on big moves from the start
* embrace managed services in the cloud
* learn what to centralize and standardize. and what not to.
* accommodate security and controls right away
* costs will hit you in the face. build cost governance into the culture.
* articulate guardrails without making constraints to allowing choice
* learn to disambiguate quickly
