FROM coolacid/buildroot-base:rpi3-latest

ARG BR2_EXTERNAL=/build/overlay

RUN mkdir /build/overlay
RUN git clone --depth 1 git://github.com/coolacid/Buildroot-overlay.git /build/overlay
COPY config /build/buildroot
RUN support/kconfig/merge_config.sh -e ${BR2_EXTERNAL} .config config 
RUN make oldconfig BR2_EXTERNAL=${BR2_EXTERNAL}
RUN make 
USER root
