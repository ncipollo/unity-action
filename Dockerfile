FROM gableroux/unity3d:latest

WORKDIR /root
COPY . .

CMD cd /root && sh main.sh