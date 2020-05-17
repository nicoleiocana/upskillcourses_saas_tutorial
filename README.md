# DevMatch

_A membership site where entrepreneurs can meet developers_. This Software-as-a-Service, Ruby on Rails App is the final product at the completion of [Upskill's The Essential Web Developer Course](https://upskillcourses.com/courses/essential-web-developer-course).
The site features a user registration/authentication supplied from [Devise](https://github.com/heartcombo/devise), user profiles, email notifications
with [Mailgun](https://www.mailgun.com/), image uploads provided by [Amazon S3](https://aws.amazon.com/s3/), and subscription membership billing with the use of [Stripe](https://stripe.com/en-ca).
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
## Functionality Modifications

**Notes: This app was completed in October 2019. Rob Dey has updated The Essential Web Developer Course. I have not viewed the video tutorials so I can neither confirm nor deny that he resolved the issues prior to the October 2019 edition.
Below are crucial updates and resolutions to some issues.**

| Issue | Resolution |
|-----|-----|
| [Paperclip is deprecated](https://github.com/thoughtbot/paperclip) | [ActiveStorage](https://guides.rubyonrails.org/active_storage_overview.html) is utilized in development |
| | Since [Heroku momentarily stores user images](https://devcenter.heroku.com/articles/dynos#ephemeral-filesystem), Amazon's S3 is used in production |
| No image validations | `gem 'active_storage_validations', '~> 0.8.9'` in the Gemfile |
| | `validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" }, size: { less_than: 5.megabytes, message: "should be less than 5MB" }` in `profile.rb` |
| | `<script type="text/javascript"> $("#profile_avatar").bind("change", function() { const size_in_megabytes = this.files[0].size/1024/1024; if (size_in_megabytes > 5) { alert("Maximum file size is 5MB. Please choose a smaller file.");  $("#profile_avatar").val(""); } }); </script>` in the `_form.html.erb` file |
| No image resizing | `$ sudo yum -y install ImageMagick` (yum because of Amazon Linux) |
| | `gem 'image_processing', '~> 1.10', '>= 1.10.3'` & `gem 'mini_magick', '~> 4.10', '>= 4.10.1'` in Gemfile |
| | `def display_avatar avatar.variant(combine_options: { auto_orient: true, gravity: "center", resize: "128x128^", crop: "128x128+0+0" }) end` in `profile.rb` |
| | update `@user.profile.avatar.url` to `@user.profile.display_avatar` in `show.html.erb` in the *users* folder |
| | update `user.profile.avatar.url` to `user.profile.display_avatar` in `index.html.erb` in the *users* folder |

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