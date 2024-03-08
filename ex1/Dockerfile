FROM ubuntu:latest
RUN useradd -ms /bin/bash John
COPY create_large_file.sh .
RUN ./create_large_file.sh
COPY bash.sh .
