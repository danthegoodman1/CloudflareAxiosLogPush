## Rant incoming

Cloudflare mind-numbingly sends a POST request with the body `test` and `content-type: application/json` to verify that an endpoint works, meaning that you CANNOT have logpush go directly to axiom because THAT TEST REQUEST WILL FAIL.

WHO WROTE THAT. WHO APPROVED THAT.

Anyway this gets around that issue.


## Env vars (see code and setup.sh)

TOKEN, EMAIL, APIKEY, DATASET, SUBDOMAIN

## Do these logs get included?

No, see the filter parameter of `setup.sh`. You could also change the filter to something else like path or host if for some reason you want to change the worker name.
