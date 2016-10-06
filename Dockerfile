FROM nvidia/cuda:8.0-devel

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
          ${WORK_DIR}/src && \
    make

# Setup user.
RUN chmod u+s /usr/bin/whoami && \
    adduser --system --no-create-home --disabled-password --disabled-login --shell /bin/sh user && \
    find / -perm +6000 -type f -exec chmod a-s {} \;  || true # Remove Setuid/Setgid Binaries

ENV HOME ${WORK_DIR}
ENV SOURCE_DIR ${WORK_DIR}
ENV BUILD_DIR ${WORK_DIR}

VOLUME ${WORK_DIR}
WORKDIR ${WORK_DIR}

USER user

CMD /bin/bash
