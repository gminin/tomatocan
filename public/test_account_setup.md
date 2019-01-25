# Stripe
1. Login to dashboard.stripe.com
1. In the left-hand sidebar, toggle -_View test data_ to On.
1. Go to Developers > API Keys
  1. Copy the Publishable key to your config/initializers/aakeys.rb file as the key for the STRIPE_PUBLIC_KEY variable.
  1. Click “Reveal test key token”
  1. Copy the Secret key to your config/initializers/aakeys.rb file as the key for STRIPE_SECRET_KEY variable.
1. Go to Connect > Settings
1. Copy the Test mode client ID to your config/initializers/aakeys.rb file as the key for the STRIPE_CONNECT_CLIENT_ID variable.
1. You can run a test purchase by finding a perk to buy, using 4242424242424242 as the card number, and random information for the rest of the fields. Go back to the Developers tab to check for your successful API request.

# Amazon AWS
1. Login to [Stripe](https://dashboard.stripe.com)
1. In the left-hand sidebar, toggle _View test data_ to *On*.
1. Go to _Developers_ > _API Keys_
1. Copy the _Publishable key_ to your `config/initializers/aakeys.rb` file as the key for the *STRIPE_PUBLIC_KEY* variable.
1. Click “Reveal test key token”
1. Copy the Secret key to your `config/initializers/aakeys.rb` file as the key for *STRIPE_SECRET_KEY* variable.
1. Go to Connect > Settings
1. Copy the _Test mode client ID_ to your `config/initializers/aakeys.rb` file as the key for the *STRIPE_CONNECT_CLIENT_ID* variable.
1. You can run a test purchase by using *4242424242424242* as the card number, and random information for the rest of the fields. Go back to the _Developers_ in Stripe tab to check for your successful API request.