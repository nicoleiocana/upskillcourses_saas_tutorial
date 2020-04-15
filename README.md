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