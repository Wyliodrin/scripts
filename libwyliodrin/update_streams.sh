#/bin/sh

if [ "$wyliodrin_board" == "beagleboneblack" ]; then
    sudo rm /wyliodrin/tmp
fi

ls /wyliodrin/node-red || git clone https://github.com/Wyliodrin/node-red.git /wyliodrin/node-red

cd /wyliodrin/node-red
git pull
npm install --production --unsafe-perm

