FROM gableroux/unity3d:2020.1.2f1

WORKDIR /root
COPY . .

CMD cd /root && ./main.sh