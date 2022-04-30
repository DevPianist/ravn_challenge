part of 'character_repository_test.dart';

const _characterListResponse = '''
{
  "allPeople":{
    "pageInfo":{
      "hasNextPage":true,
      "endCursor":"YXJyYXljb25uZWN0aW9uOjE5"
    },
    "people":[
      {
        "id":"cGVvcGxlOjEx",
        "name":"Anakin Skywalker",
        "species":null,
        "homeworld":{
          "name":"Tatooine"
        }
      },
      {
        "id":"cGVvcGxlOjEy",
        "name":"Wilhuff Tarkin",
        "species":null,
        "homeworld":{
          "name":"Eriadu"
        }
      },
      {
        "id":"cGVvcGxlOjEz",
        "name":"Chewbacca",
        "species":{
          "name":"Wookie"
        },
        "homeworld":{
          "name":"Kashyyyk"
        }
      },
      {
        "id":"cGVvcGxlOjE0",
        "name":"Han Solo",
        "species":null,
        "homeworld":{
          "name":"Corellia"
        }
      },
      {
        "id":"cGVvcGxlOjE1",
        "name":"Greedo",
        "species":{
          "name":"Rodian"
        },
        "homeworld":{
          "name":"Rodia"
        }
      },
      {
        "id":"cGVvcGxlOjE2",
        "name":"Jabba Desilijic Tiure",
        "species":{
          "name":"Hutt"
        },
        "homeworld":{
          "name":"Nal Hutta"
        }
      },
      {
        "id":"cGVvcGxlOjE4",
        "name":"Wedge Antilles",
        "species":null,
        "homeworld":{
          "name":"Corellia"
        }
      },
      {
        "id":"cGVvcGxlOjE5",
        "name":"Jek Tono Porkins",
        "species":null,
        "homeworld":{
          "name":"Bestine IV"
        }
      },
      {
        "id":"cGVvcGxlOjIw",
        "name":"Yoda",
        "species":{
          "name":"Yoda's species"
        },
        "homeworld":{
          "name":"unknown"
        }
      },
      {
        "id":"cGVvcGxlOjIx",
        "name":"Palpatine",
        "species":null,
        "homeworld":{
          "name":"Naboo"
        }
      }
    ]
  }
}
''';
const _characterDetailResponse = '''
{
  "person":{
    "id":"cGVvcGxlOjk=",
    "name":"Biggs Darklighter",
    "eyeColor":"brown",
    "hairColor":"black",
    "skinColor":"light",
    "birthYear":"24BBY",
    "vehicleConnection":{
      "vehicles":[
        {
          "id":"dmVoaWNsZXM6MTQ=",
          "name":"Snowspeeder"
        },
        {
          "id":"dmVoaWNsZXM6MzA=",
          "name":"Imperial Speeder Bike"
        }
      ]
    }
  }
}
''';
