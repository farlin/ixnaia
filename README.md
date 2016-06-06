# ixnaia
A simple lesson tracker web application

## Getting Started

Pull the git repo to your local machine

Run the bundler
```
bundle install
```

Run the database migration and seed file
```
rake db:migrate db:seed
```
Running the seed file should explain what seed data is being created.


Run the rails s
```
rails s
```

The application will be accessible at http://localhost:3000/

## Adding data via json request

There are two endpoint available for json requests:
```
http://YOUR_HOST:3000/students/:student_id/progress (GET/POST)
```
For post request, it accepts following fields:
```
progress[lesson_id]: ANY_VALID_LESSON_ID
progress[sequence]: PART_NUMBER 
```
For sample data, please see seed.rb file.


If you are looking for a json request handling tool - try [PostMan](https://www.getpostman.com/)

## Running the tests

To run the tests simply run 
```
rake
```

## Author

* **Nishat Ara Alam** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
