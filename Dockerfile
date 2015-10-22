# base image
FROM debian

# install packages and build environment
RUN apt-get update && apt-get install -my
RUN	apt-get install build-essential ant git -my

# define mountable directories.
VOLUME ["/runtime"]

# expose ports
EXPOSE 80
EXPOSE 443
EXPOSE 9080
EXPOSE 9443