FROM gableroux/unity3d:latest

WORKDIR /root
COPY main.sh .
COPY license.sh .

CMD cd /root && sh main.sh