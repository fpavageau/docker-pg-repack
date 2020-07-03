FROM debian:stable

RUN apt-get -qq update && \
    apt-get -qq -y install ca-certificates gnupg2 lsb-release wget && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    apt-get -qq update && \
    apt-get -qq -y install postgresql-client-11 postgresql-11-repack=1.4.4-2 && \
    apt-get -qq autoremove && \
    rm -rf /var/lib/apt/lists/* /var/lib/dpkg/info
