FROM gableroux/unity3d:2019.3.1f1

WORKDIR /root
COPY . .

CMD cd /root && ./main.sh