FROM crystallang/crystal

ADD . /proxy_rotator

WORKDIR /proxy_rotator

RUN shards install

RUN crystal build http_proxy.cr

EXPOSE 3199

CMD ./http_proxy -h 0.0.0.0
