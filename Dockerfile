FROM gableroux/unity3d:latest

WORKDIR /root/
COPY main.sh .
RUN ls /
RUN ls
RUN pwd

CMD sh /root/main.sh