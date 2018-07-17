# Istio Envoy and K8s
* Christian Posta
* Slides: http://blog.christianposta.com/istio-workshop/slides/
* Source Code: https://github.com/christian-posta/istio-workshop
* Not a beginner level. How does Istio work?

# K8s helps deploy...
* It doesn't solve network issues connecting services to one another
* It does have virtual IP addresse and has a DNS service discovery system
* Simple load balancing, but not beyond basic provisioning

## But has some problems.
* Each language needs to implement all this functionality
* If any language/framework can implement this, we need a proxy with load balancing and discovery built in...

# Meet Envoy!
* Started at Lyft in 2015
* Service Proxy written in C++, highly parallel, non-blocking
* It intermediates communication, works as a network filter
* HTTP2 and gRPC

## Proxy Types
* Edge Proxy - load balancing before a services
* Shared Proxy - works as application proxy
* Sidecar Proxy - each application instance has config/control over itself
* Now we have the ability to do circuit breaking, retries, rate limiting and more
* Question: "This seems to have a ton of overhead... why not just use Kafka instead?"
  * messaging is a good idea, yes.
  * but you'll need HTTP services or gRPC interfaces
  * Google doesn't use any queuing at all. Amazon does. Depends on architecture.

# THE NOTES ARE ALL ON THE SLIDES
* https://github.com/christian-posta/istio-workshop

# What's What
* Envoy - a service proxy for routing and discovery of services
* Istio - a service mesh for service proxies to configure (and reconfigure) a fleet of envoy proxies
* Helm - a package manager for Istio
