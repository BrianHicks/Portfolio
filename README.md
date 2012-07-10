Portfolio
=========

About
-----

Hi, I'm Brian Hicks. I'm a Web and Graphic design student at
John Brown Univeristy planning to graduate in December of 2011.
I built this site as part of the final class in my program. It has
some of my student work on it, plus a little more if you look in
my philosophy. As for the technical details, this site was built
with Ruby on Rails. It hosts the image assets on Amazon S3 and uses
jQuery for the front-end interaction. You can check out the source
as well as more techical details of how I built the site here on Github.

Deployment
----------

If you want to modify this code and run it on your own server, feel free.
Just come up with your own look! That's half the fun! So after setting up
a basic rails environment, here's what you need to do.

1. `bundle install` to get all the gems
2. Using the console create a user for yourself.
   It's devise, so you need to set `:email`, `:password`,
   and `:password_confirmation`. In addition, you can
   set `:first_name`, `:middle_name`, and `:last_name`.
   Only `:first_name` and `:last_name` are currently
   used in the app; check out the user model for more
   methods related to names. But registrations are disabled in devise so that
   random people cannot register on the site and post portfolio items.
3. Set up the environment variables for S3. You need `S3_SECRET`,
   `S3_KEY`, and `S3_BUCKET`. (hint: `heroku config:add KEY=VALUE`).
   You can check out and change how the variables are used in
   app/models/asset.rb
4. Push however you want, I use Heroku and the app is optimized for it,
   so if you want to run your own server, you'll need to set up
   delayed_job workers on it.
