FROM swiftdocker/swift

RUN apt-get update -y && apt-get install -y ffmpeg

RUN apt-get install -y libopus-dev

RUN apt-get install -y software-properties-common
RUN apt-get install -y libsodium-dev

RUN curl -sL https://apt.vapor.sh | bash -s && apt-get update && apt-get install -y vapor

COPY ./Cryptob /source

RUN cd /source && swift build -Xlinker -L/usr/local/lib -Xlinker -lopus -Xcc -I/usr/local/include

RUN chmod +x /source/.build/debug/DiscordBot

CMD /source/.build/debug/DiscordBot
