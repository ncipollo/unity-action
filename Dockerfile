FROM gableroux/unity3d:latest

WORKDIR /root
RUN ls /
RUN ls /home
RUN ls /root
COPY main.sh .
COPY license.sh .

CMD cd /root && sh main.sh