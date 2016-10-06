FROM nvidia/cuda:devel-ubuntu16.04

MAINTAINER Abdul Dakkak "dakkak@illinois.edu"

RUN apt-get update && \
    apt-get install --no-install-recommends -y unzip git cmake && \
    rm -rf /var/lib/apt/lists/*


# Compile teachingkit.
ENV WORK_DIR /opt/teachingkit
COPY . ${WORK_DIR}/src/
WORKDIR ${WORK_DIR}/build
RUN cmake -DBUILD_DESCRIPTION=OFF \
          -DBUILD_DATASET_GENERATOR=ON \
          -DBUILD_LIBWB_LIBRARY=ON \
          -DBUILD_SOLUTION=ON \
          -DBUILD_TEMPLATE=OFF \
          -DBUILD_USING_DOCKER=ON \
          -DCMAKE_BUILD_TYPE=Release \
          ${WORK_DIR}/src && \
    make -j4

ENV HOME ${WORK_DIR}
ENV SOURCE_DIR ${WORK_DIR}
ENV BUILD_DIR ${WORK_DIR}

VOLUME ${WORK_DIR}
WORKDIR ${WORK_DIR}

CMD /bin/bash
