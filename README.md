# DevMatch

_A membership site where entrepreneurs can meet developers_. This Software-as-a-Service, Ruby on Rails App is the final product at the completion of [Upskill's The Essential Web Developer Course](https://upskillcourses.com/courses/essential-web-developer-course).
The site features a user registration/authentication supplied from [Devise](https://github.com/heartcombo/devise), user profiles, email notifications
with [Mailgun](https://www.mailgun.com/), image uploads provided by [Paperclip](https://github.com/thoughtbot/paperclip), and subscription membership billing with the use of [Stripe](https://stripe.com/en-ca).
The front-end UI and layout utilizes the Twitter Bootstrap library and borrows an icon from Font Awesome. The back-end consists of form validations
and relational databases amongst the plans, users, and profiles tables. The highlight that stands out in this project was to successfully integrate
Stripe:
1. Users will have an associated stripe customer token.
2. When forms are submitted, every user record will have a membership plan associated: a Basic account or Pro account.
3. Regarding a Pro account, javascript will prevent the form from submitting:
    * first, the CC info will be validated by the Stripe module before sending it to Stripe
    * then, the form will wait for Stripe to return with a card token.
4. Javascript will send user fields and card token to our rails app for validation.
5. Once validated, Rails should send user info: email, plan id, and card token to Stripe server and Stripe will create a subscription and send back the customer token. Rails will save customer token and user information to our database.
-----
## Installation

1\. To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

### Prerequisites Before Continuing with Installation

i. You will need to create a Stripe account to obtain the API key.

[Create your Stripe account.](https://dashboard.stripe.com/register)

On your dashboard, your test API keys are directly below the _Get your test API keys_ section. Click on the show/ hide icon to view the Secret Key.

![Stripe dashboard](https://i.imgur.com/RHtQBzv.png)

ii. The following commands are written in the terminal:

```
bundle exec figaro install
touch config/initializers/stripe.rb
```

iii. The following text is written in `config/initializers/stripe.rb`

```
Stripe.api_key = ENV["stripe_api_key"]
STRIPE_PUBLIC_KEY = ENV["stripe_publishable_key"]
```
iv. The following text is written in the `config/application.yml` (Put your Stripe API keys in this file)

```
...
stripe_api_key: sk_test_6Wa4cw7hhDiS2oabcdefg123456
stripe_publishable_key: pk_test_gj3DgfQoHLUabcdefg123456
#
production:
  stripe_api_key: sk_test_6Wa4cw7hhDiS2oabcdefg123456
  stripe_publishable_key: pk_test_gj3DgfQoHLUabcdefg123456
```
  
v. You are now ready to complete the installation the app. For more information, see the
[Figaro Gem and API Keys video](https://upskillcourses.com/courses/essential-web-developer-course/figaro-gem-and-api-keys).

2\. Next, migrate the database:

```
$ rails db:migrate
```

3\. Run the app on http://localhost:3000. 

```
$ rails s
```

-----
## Screenshots

![DevMatch desktop](https://i.imgur.com/OjqfWrs.png)

![DevMatch mobile](https://i.imgur.com/skoOsvo.png)
-----
## Screen Capture

**Demo of CC info accepted**

![successful cc demo](https://i.imgur.com/eG19kyK.gif)