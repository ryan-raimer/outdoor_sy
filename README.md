# README

Hello person who was tasked to look at my code (and/or Beth). Welcome to Outdoor.sy! Capable of running in a fully containerized docker environment.

A few notes to start:
1) I mainly made it containerized because I know that some dev environments can be fragile so I'm hoping taking a look and getting it running locally is as least invasive into whoever's dev environment as possible.
2) I mainly focused on backend rubyist stuff (the rake task and related service are probably the coolest things in this code)
3) The frontend is super basic (used bootstrap + a plugin for the sorting criteria)
4) The "Some actual code I wrote" commit will have the most relevant non-generated code

Things I would improve (at a minimum)/normally do if it would go to production:
1) I would write tests!
2) Adding an ability to upload a file via the UI (and general UI improvements)
3) Have more discussions with the product owner to fully understand the intent of the feature (this helps when making decisions like what do I name the object that represents the... [Person, Customer, VehicleOwner, .etc])

The tech:
Ruby 3 - Rails 6.1.4
Dockerized (https://hub.docker.com/r/ryanraimer/outdoor_sy)
Bootstrap
PostgreSQL


How to run it!

1) Clone the GitHub repo
2) `docker-compose up`
3) exec into the web container and run `bin/setup` (this'll get the db all set and the initial files provided loaded in using the rake task)
4) Go to localhost:3000 and admire a basic table with sorting functionality (by clicking the header - UX could definitely improve)

Looking to add a file?
Run `rake import_file` (ex: `rake import_file -- -f "./tmp/commas.txt"`)
