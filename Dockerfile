# choose starting image @ debian:jessie + julia:v0.5.2
FROM julia:0.5.2

MAINTAINER Alin CHIS <alin.d.chis@gmail.com>

# add cmake - required to build Escher
RUN apt-get update && apt-get install -y cmake netcat sqlite3 unzip && apt-get clean

# add julia packages
RUN /usr/local/julia/bin/julia -e 'Pkg.update()'
RUN /usr/local/julia/bin/julia -e 'Pkg.add("Redis")'
RUN /usr/local/julia/bin/julia -e 'Pkg.add("ODBC")'
RUN /usr/local/julia/bin/julia -e 'Pkg.add("SQLite")'
RUN /usr/local/julia/bin/julia -e 'Pkg.add("HttpParser")'
RUN /usr/local/julia/bin/julia -e 'Pkg.add("HttpServer")'
RUN /usr/local/julia/bin/julia -e 'Pkg.add("WebSockets")'


# julia environment variables
ENV JULIA_VER v0.5
ENV JULIA_PKG_DIR /root/.julia/${JULIA_VER}

# add symlinks to julia
RUN ln -fs /usr/local/julia/bin/julia /usr/bin/julia
