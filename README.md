# Cosock Tests

Run the cosock tests in a similar manner as github actions with 1 container per supported lua
version. The primary goals here is to allow for running the tests locally isolating lua versions
when errors arise.

## Setup

Run `generate_test_chain.sh` from the root of this project to populate the test script for each
container. The only argument here needs to be the path to your local cosock directory.

Now you can build each container, the example below will create a container tagged
`ct<lua version>`.

```sh
docker build -t ct5.1 ./5.1
docker build -t ct5.2 ./5.2
docker build -t ct5.3 ./5.3
docker build -t ct5.4 ./5.4
```

## Running

To run the tests you need to provide a volume pointed to your local cosock directory the below
example assumes the same tag scheme used above.

```sh
docker run -v /path/to/cosock:/cosock ct5.1
```

This will spin up the docker container and run all of the tests.
