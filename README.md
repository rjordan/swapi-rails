# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Example GraphQL
```graphql
fragment shipfields on Starship {
    id
    name
    MGLT
    manufacturer
    model
    starshipClass
    costInCredits
    length
    maxAtmosphericSpeed
    hyperdriveRating
    crew
    passengers
    consumables
    cargoCapacity
}

query listStarships {
  starships {
    pageInfo {
      startCursor
      endCursor
      hasNextPage
      hasPreviousPage
    }
    nodes {
			...shipfields
    }
  }
}

query getStarship ($starshipId:String!) {
  starship (id: $starshipId) {
    ...shipfields
  }
}
```

Variables
```json
{
  "starshipId": "ca7f9089-7de6-4e32-b350-39d603bd9ba4"
}
```
