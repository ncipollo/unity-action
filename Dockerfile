FROM gableroux/unity3d:latest

WORKDIR /root/
RUN ls
COPY main.sh .
CMD sh main.sh