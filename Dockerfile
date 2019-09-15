FROM gableroux/unity3d:2019.2.2f1

WORKDIR /root
COPY . .

CMD cd /root && ./main.sh