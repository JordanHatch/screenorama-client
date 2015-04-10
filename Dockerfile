FROM resin/rpi-node:0.10-wheezy

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		chromium-browser \
		fbset \
		htop \
		libnss3 \
		libraspberrypi-bin \
		matchbox \
		psmisc \
		sqlite3 \
		ttf-mscorefonts-installer \
		x11-xserver-utils \
		xinit \
		xwit

RUN mkdir -p /usr/src/app \
	&& ln -s /usr/src/app /app

WORKDIR /usr/src/app

COPY package.json /usr/src/app/

RUN npm install --production --unsafe-perm

COPY . /usr/src/app

CMD [ "npm", "start" ]
