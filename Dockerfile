FROM vokez/xts-rippled-base


ADD . /opt/source/xts-rippled/

RUN    cd /opt/source/xts-rippled/ && mkdir _xts && cd _xts && export CXXFLAGS=" -Os" && \
    cmake -Dtarget=clang.debug.nounity -DJSON_FOR_MODERN_CXX_INCLUDE_DIR:PATH=/opt/source/xts-rippled/src/json/include -DCMAKE_BUILD_TYPE=Release  .. && \
    cmake  --build . -- -j 2


ADD rippled-xts.cfg /etc/opt/ripple/rippled.cfg
ADD validators-xts.txt /etc/opt/ripple/validators.txt


CMD ["/opt/source/xts-rippled/_xts/rippled"]