# Airfy

Hello, Eugene! I built this application for a code challenge.

### Features

* The app consists of two modules: `Airfy.Encryptor` which takes key and data and returns encryption result. The second module is `Airfy` itself. I decided to expand challenge a little bit so that I added command line interface to it (I didn't have experience with command line interface before);
* This encryptor uses symmetric encryption. I decided not to fight against gpg for this simple task;
* It uses [siphash](https://github.com/zackehh/siphash-elixir) alghorhythm implementation for elixir. I found it stable & well maintained enough;
* It's a test covered app. It has 1 test :) There is no need to cover simple pattern matched interface by big test suite;
* It's ready to be released with `exrm` or `distillery`.

Total time it took to implement, test & document: 2 hrs 10 mins

### Command line interface

```
./airfy --key-path priv/key.txt --message "I love elixir"
```

### Getting started

* `mix deps.get`
* Generate key file with random content `base64 /dev/urandom | head -c 1000 > priv/key.txt`
* `mix escript.build`
* Run command line
