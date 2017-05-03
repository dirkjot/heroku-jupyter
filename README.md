# jupyter on PEZ


PEZ is the Cloud Foundry instance for Pivots.  If you are not working for
Pivotal this repository may not help you much.

This repository is a modified version of [Heroku-Jupyter](https://github.com/pl31/heroku-jupyter).

Use this application to deploy [Jupyter Notebook](https://jupyter.org/) to
heroku or CloudFoundry. It requires a postgres database which is used as notebook
storage (see [pgcontents](https://github.com/quantopian/pgcontents)).

## Installation instructions

Currently, CloudFoundry has an issue with websockets and passwords, see [this bug](https://github.com/pl31/heroku-jupyter/issues/4).

We therefore deploy this notebook _without any security_.  This is
probably not what you want.  

The `push.sh` script will:
- create a user provided service definition which is essentially a way to provide
  your postgres details to the Notebook,
- Push the notebook up to PEZ,
- Change settings so that it will use 2G of RAM and not use a password,
- Start the app
- Display the URL where your notebook lives
