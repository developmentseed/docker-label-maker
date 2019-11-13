FROM python:3.6
LABEL maintainer="developmentseed"

ENV workdir /usr/src/app
RUN mkdir $workdir

RUN apt-get update -y
RUN apt-get install -y \
    libsqlite3-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    wget \
    git \
    jq

# Install tippecanoe
RUN git clone --progress https://github.com/mapbox/tippecanoe.git && \
    cd tippecanoe && \
    make -j && \
    make install

# Install remaining python dependencies
RUN pip install \
    Cython==0.28.2 \
    lxml==4.2.1

# Install Proto
RUN wget https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip -P $workdir
RUN unzip $workdir/protoc-3.2.0-linux-x86_64.zip -d $workdir/protoc3
RUN mv -f $workdir/protoc3/bin/* /usr/local/bin/
RUN mv -f $workdir/protoc3/include/* /usr/local/include/
RUN ln -s -f /usr/local/bin/protoc /usr/bin/protoc

RUN git clone https://github.com/developmentseed/label-maker.git && cd label-maker  && git checkout 0.6.1 && python setup.py install

WORKDIR $workdir
VOLUME $workdir
