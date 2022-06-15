<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** github_username, repo_name, twitter_handle, email, project_title, project_description
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

# Whether Sweater
<!-- TABLE OF CONTENTS -->
<summary><h2 style="display: inline-block">Table of Contents</h2></summary>
<ol>
  <li><a href="#about-the-project">About The Project</a>
  <li><a href="#learning-goals">Learning Goals</a>
  <li><a href="#skills-developed">Skills Developed</a>
  <li><a href="#built-with">Built With</a>
  <li><a href="#setup-instructions">Setup Instructions</a></li>
  <li><a href="#endpoint-documentation">Endpoint Documentation</a></li>
  <li><a href="#author-and-contact-information">Author and Contact Information</a></li>
</ol>

<!-- ABOUT THE PROJECT -->
## About The Project

[Whether Sweater](https://github.com/jhennerich/whether_sweater) A service-oriented architecture design software application project for the Turing School of Software & Design which provides API endpoints for a hypothetical application used to plan road trips.

[PROJECT requirement specifications](https://backend.turing.edu/module3/projects/sweater_weather/requirements)
Turing's original project requirements.

## Learning Goals:

  * Expose an API that aggregates data from multiple external APIs
  * Expose an API that requires an authentication token
  * Expose an API for CRUD functionality
  * Determine completion criteria based on the needs of other developers
  * Research, select, and consume an API based on your needs as a developer

## Skills Developed

* Practiced MVC concepts, effectively staying within rails conventions
* Consumed multiple API endpoints and utilized POROS and Serializers as a way to apply OOP principals  
* Implemented user authentication and authorized sessions.
* Employed test driven development TDD to achieve project goals.

<!-- BUILT WITH -->
## Built With

* [Ruby on Rails 5.2.8](https://rubyonrails.org/)
* [Ruby 2.7.2](https://ruby-doc.org/core-2.7.2/)
* [Postgresql](https://www.postgresql.org/)

<!-- SETUP INSTRUCTIONS -->
## Setup Instructions
To download a local copy please follow the below steps.

1. Clone the repo
   ```
   git clone https://github.com/jhennerich/whether_sweater
   ```
2. Install dependencies
   ```
   bundle install
   ```
3. DB creation/migration
   ```
   rails db:create
   rails db:migrate
   ```
4. Install figaro:  creates a local config/application.yml file
    ```
    bundle exec figaro install
    ```
5. Obtain and install required API keys in application.yml
  * [MapQuest's Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
  `application.yml value mapquest_api_key`
  * [OpenWeather One Call API](https://openweathermap.org/api/one-call-api)
  `application.yml value openweather_appid`
  * [Unsplash](https://unsplash.com/documentation#creating-a-developer-account)
  `application.yml value unsplash_api_key`

6. Run tests and view test coverage
   ```
   bundle exec rspec
   open coverage/index.html
   ```
7. Run server and navigate to http://localhost:3000/
   ```
   rails s
   ```

## Endpoint Documentation   
#### GET /api/v1/forecast - weather for a location
* `GET http://localhost:3000/api/v1/forecast?location=denver,co`
  * Example results
  ```
  {
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-06-14T23:24:54.000+00:00",
                "sunrise": "2022-06-14T11:31:26.000+00:00",
                "sunset": "2022-06-15T02:29:10.000+00:00",
                "temperature": 82.81,
                "feels_like": 80.58,
                "humidity": 23,
                "uvi": 2.79,
                "visibility": 10000,
                "conditions": "few clouds",
                "icon": "02d"
            },
            "daily_weather": [
                {
                    "date": "2022:06:14",
                    "sunrise": "2022-06-14T11:31:26.000+00:00",
                    "sunset": "2022-06-15T02:29:10.000+00:00",
                    "max_temp": 83.26,
                    "min_temp": 61.21,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "date": "2022:06:15",
                    "sunrise": "2022-06-15T11:31:27.000+00:00",
                    "sunset": "2022-06-16T02:29:34.000+00:00",
                    "max_temp": 87.67,
                    "min_temp": 57.18,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022:06:16",
                    "sunrise": "2022-06-16T11:31:29.000+00:00",
                    "sunset": "2022-06-17T02:29:55.000+00:00",
                    "max_temp": 94.44,
                    "min_temp": 65.21,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022:06:17",
                    "sunrise": "2022-06-17T11:31:33.000+00:00",
                    "sunset": "2022-06-18T02:30:15.000+00:00",
                    "max_temp": 96.13,
                    "min_temp": 70.36,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022:06:18",
                    "sunrise": "2022-06-18T11:31:39.000+00:00",
                    "sunset": "2022-06-19T02:30:34.000+00:00",
                    "max_temp": 97.43,
                    "min_temp": 71.62,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "23:00:00",
                    "temperature": 82.81,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "00:00:00",
                    "temperature": 83.05,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "01:00:00",
                    "temperature": 82.63,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "02:00:00",
                    "temperature": 80.29,
                    "conditions": "few clouds",
                    "icon": "02d"
                },
                {
                    "time": "03:00:00",
                    "temperature": 74.61,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "04:00:00",
                    "temperature": 68.13,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "05:00:00",
                    "temperature": 64.58,
                    "conditions": "clear sky",
                    "icon": "01n"
                },
                {
                    "time": "06:00:00",
                    "temperature": 63.09,
                    "conditions": "clear sky",
                    "icon": "01n"
                }
            ]
        }
    }
  }
  ```

#### GET /api/v1/backgrounds - image for location
* `GET http://localhost:3000/api/v1/backgrounds?location=denver,co`
  * Example results
  ```
  {
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "location": "denver, co",
                "image_url": "https://images.unsplash.com/photo-1629163330223-c183571735a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMzY5NDN8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2NTUyNDkzNzg&ixlib=rb-1.2.1&q=80&w=1080",
                "credit": {
                    "source": "https://api.unsplash.com/photos/zSm5JPgNeuc",
                    "author": "Taylor Daugherty"
                }
            }
        }
    }
  }
  ```

#### POST /api/v1/users - create new user.
* `POST http://localhost:3000/api/v1/users`
- Please note you must call this endpoint with a JSON Body
```
{
    "email":"someone@email.com",
    "password":"password",
    "password_confirmation":"password"
}
```
  * Example results
  ```
  {
    "data": {
        "id": "2",
        "type": "users",
        "attributes": {
            "email": "someone@email.com",
            "api_key": "8ed75a909699057ddd8f4d4c12a1e110"
        }
    }
  }
  ```

#### POST /api/v1/sessions - user authentication
* `POST http://localhost:3000/api/v1/sessions`
- Please note you must call this endpoint with a JSON Body
```
{
    "email":"john@email.com",
    "password":"password",
    "password_confirmation":"password"
}
```
  * Example results
```
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "email": "john@email.com",
            "api_key": "6cd1a7e46b1e465816d7c44f00d12fa0"
        }
    }
}
```

#### POST /api/v1/sessions - road trip information
* `POST http://localhost:3000/api/v1/road_trip`
- Please note you must call this endpoint with a JSON Body
```
{
    "origin":"Denver, CO",
    "destination":"St. Louis, MO",
    "api_key": "1105647f94680eb28e4d929bf1012ca0"
}
```
  * Example results
  ```
  {
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver, CO",
            "end_city": "St. Louis, MO",
            "road_trip_time": "12 hours, 7 minutes, and 23 seconds",
            "weather_at_eta": {
                "temperature": 96.42,
                "conditions": "clear sky"
            }
        }
    }
  }
  ```

## Author and Contact Information
- **John Hennerich** - *Turing Student* - [GitHub Profile](https://github.com/jhennerich) - [LinkedIn](https://www.linkedin.com/in/john-hennerich)
