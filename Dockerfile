FROM coolacid/buildroot-base:rpi3-latest

RUN mkdir /build/overlay
RUN git clone --depth 1 git://github.com/coolacid/Buildroot-overlay.git /build/overlay
COPY config /build/buildroot
RUN support/kconfig/merge_config.sh -m .config config 
RUN make oldconfig
RUN make 
