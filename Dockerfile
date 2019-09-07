FROM gableroux/unity3d:latest

RUN cd /root/
RUN ls
COPY main.sh .
CMD sh main.sh