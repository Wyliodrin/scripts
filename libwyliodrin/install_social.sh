#!/bin/bash

INSTALL_SOCIAL_PATH=/tmp/install_social

# folder
rm -rf $INSTALL_SOCIAL_PATH
mkdir $INSTALL_SOCIAL_PATH
cd $INSTALL_SOCIAL_PATH

#python

echo "Checking for python setuptools"
if ! echo "import setuptools" | python; then
	echo "Installing python setuptools"
	curl -L https://bootstrap.pypa.io/ez_setup.py | python
fi

cd $INSTALL_SOCIAL_PATH
echo "Checking python facebook"
if ! echo "import facebook" | python; then
	echo "Installing python facebook"
	curl -L https://github.com/pythonforfacebook/facebook-sdk/archive/master.zip > facebook.zip
	unzip facebook.zip
	cd facebook-sdk-master
	python setup.py install
	cd ..
fi

echo "Checking python tweepy"
if ! echo "import tweepy" | python; then
	echo "Installing python tweepy"
	curl -L https://github.com/tweepy/tweepy/archive/v2.3.0.zip > tweepy.zip
	unzip tweepy.zip
	cd tweepy-2.3.0
	python setup.py install
	cd ..
fi

echo "Checking python twilio"
if ! echo "import twilio" | python; then
	echo "Installing python twilio"
	curl -L https://github.com/twilio/twilio-python/archive/3.6.5.zip > twilio-python.zip
	unzip twilio-python.zip
	cd twilio-python-3.6.5
	python setup.py install
	cd ..
fi

echo "Checking python flask"
if ! echo "import flask" | python; then
	echo "Installing python flask"
	curl -L http://pypi.python.org/packages/source/F/Flask/Flask-0.10.1.tar.gz > flask.tar.gz
	tar zxf flask.tar.gz
	cd Flask-0.10.1
	python setup.py install
	cd ..
fi


echo "Checking pybass"
if ! echo "import pybass" | python; then
	echo "Installing pybass"
	curl -L https://github.com/Wyliodrin/pybass/archive/master.zip > pybass.zip
	unzip pybass.zip
	cd pybass-master
	chmod a+x install.sh
	./install.sh
	cd ..
fi

echo "Checking pyfirmata"
if ! echo "import pyfirmata" | python; then
	echo "Installing pyfirmata"
	git clone https://github.com/tino/pyFirmata.git
	cd pyFirmata
	python setup.py install
	cd ..
fi

#javascript

export NODE_PATH=`npm root -g`

echo "Checking javascript facebook"
if ! echo "require ('fb')" | node; then
	echo "Installing javascript facebook"
	npm install -g fb
fi

echo "Checking javascript twitter"
if ! echo "require ('twitter-ng')" | node; then
	echo "Installing javascript twitter"
	npm install -g twitter-ng
fi

echo "Checking javascript twilio"
if ! echo "require ('twilio')" | node; then
	echo "Installing javascript twilio"
	npm install -g twilio
fi

echo "Checking javascript mail"
if ! echo "require ('nodemailer')" | node; then
	echo "Installing javascript nodemailer"
	npm install -g nodemailer
fi


echo "Checking javascript express"
if ! echo "require ('express')" | node; then
	echo "Installing javascript express"
	npm install -g express
	npm install -g morgan
	npm install -g body-parser
	npm install -g jinja
fi

