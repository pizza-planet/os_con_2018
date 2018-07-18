# How to Open Source an Internal Project
* Vicky (VM) @vmbrasseur
* Open Source Policy Freelancer
* FossForge.com
* Author: "Forge Your Future with Open Source"

## Setting up expectations
* No silver bullet of how to do this.
* Releasing the code is just the first. Building community is equally important.

## Identify Goals for Project
* Why does your company want to do this?
* Releasing a project as free/open source is a lot of work.
* It's OK to get something out of open sourcing a project.
  * It is most likely not a directly monetary benefit.
* It's cooperative. The community must also benefit.
  * Once released, your company is no longer the sole stake holder.
* Without a goal, the project will fail.
  * It will be the first to be cut when budget cuts come if there's no clear goal and ROI.

## Perform Prerelease Due Dillegence
* Clean up the project. Look for time bombs.
  * Credentials
  * Trademarks - even in comments
  * Profanity or Rudeness
* Proper License
  * Do you know what *other* Free and Open Source Software (FOSS) software you're using?
  * The distribution clause is where the rubber meets the road.
  * It may enforce your use of a particular license.
  * Get lawyers involved
* [ClearlyDefined.io](https://clearlydefined.io/)

## Define Process, Procedures, Policies, Legal Requirements
* Contributor License Agreement (CLA)
  * lots of admin that promises contributors have the right to
* Developer Certificate of Origin (DCO)
  * they sign with a `-s` flag on the git commit.
  * lower hassel version of the CLA
* `CONTRIBUTORS.MD` - tell folks up front how to contribute
  * Best as a meta-document that points to many other documents
  * Like a microservice controller, it points out to many
* Code of Conduct - [contributorcovenant.org](https://www.contributor-covenant.org/)
  * enforce it empathetically
* Issue Templates
* Style Guides
* CI/CD - both setting up and maintaining in the open

## License
* This is the *last* thing you should do, not the first.
* Don't play fast a loose with intellectual property.
* No license legally means that it is proprietary and illegal for folks to use.
* Which license? It depends.
* It is a spectrum of fully available to more reserved.

#### Applying a license
* `LICENSE` in the repo
* add copyright file to each and every file as comments
* add license notice to each file
* script it, put it in your linter

## Respect the Community
* Expectations & Autonomy
* Build Trust
* Work in the open. No special little branches and non-communicated features.
* Build process must happen outside of your company CI/CD
* Listen. Don't dictate.
* Collaborate. Actually accept contributions from folks.
* Transparent roadmap.
* Ensure they feel like community, not "cheap labor"
  * that leads to forks
* BE PATIENT
  * community takes time to build authentically

## Q & A
* need to put FOSS terms into business speak
  * marketing, recruiting
  * "find out what your company needs and ethically manipulate them using that."
* industry tools happen in FOSS
* you're shaping the projects themselves
* contributing to OSS is networking on easy mode
