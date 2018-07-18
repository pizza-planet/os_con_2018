# Terraforming All The Things
* Nathan Handler
* @nathanhandler
* Yelp SRE

# Cloud Computing on AWS
* Clicking through AWS console is tough
* AWS CLI is a nightmare of arguments, missing an `--iam-instance-profile` and it's busted

## Open Source Tool: wallix/awless
* abstraction on top of the aws cli
* code review is still super difficult

## Tools should not dictate your processes
* Why use untested, undocumented tools in production?
* We want version control, reviewable and free from vendor lock-in

## Hashicorp Terraform
* HCL code for infrastructure
* Why not Cloud Formation?
  * the lock in to AWS prevents use of other providers that Yelp uses
* What about chef / puppet / ansible?
  * We use both

## Traps, Tips and Gotchas
### Scare Factor
  * the plans are complex and hard to understand, so there is on-boarding issues as a tech
### AWS
  * multiple AWS accounts
  * terraform configuration is in multiple directories by project and by region
### NS1 (DNS provider)
  * name record and ttl for DNS records
  * as they got imported into terraform, time to ship grew.
  * it took more than 15 minutes to apply those changes
### SignalFx
  * internal tool
  * signal form
### Discovering Dynamic Resources
  * Terraform destroy on resources
  * the url to a dashboard would change, so hid behind a url minifier
### DNS provider
  * Fastly / Cloudflare
  * Don't join them, manage them separately
### State Management & Remote State
### Locking
### Outputs
* `terraform apply` shows certain outputs
### Automatic Applications
  * some partial states exist when the deploys fail
  * they don't automatically apply terraform changes
  * drift between console created resources and terraform makes that hard
### Generated Terraform Code
  * HCL not a full language

## In a perfect world...
  * in practice, this doesn't ever happen
