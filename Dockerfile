FROM centos:7

MAINTAINER Kevin Sayers
RUN yum -y install gcc
RUN	yum -y install gcc-c++
RUN	yum -y install openmpi-devel
RUN	yum -y install make
RUN	yum -y install zlib-devel

#Update libfabric this prevents the hfi1_0 device
#timeout error. 
RUN curl -O ftp://195.220.108.108/linux/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/l/libfabric-1.4.0-2.fc26.x86_64.rpm
RUN rpm -Uvh libfabric-1.4.0-2.fc26.x86_64.rpm
ENV PATH /usr/lib64/openmpi/bin:$PATH

#Download and install SMuFin 
RUN curl -O http://cg.bsc.es/smufin/download/smufin/smufin_0.9.3_mpi_beta.tar.gz
RUN tar -zxvf smufin_0.9.3_mpi_beta.tar.gz
WORKDIR /smufin_0.9.3_mpi_beta
RUN make
ENV PATH /smufin_0.9.3_mpi_beta:$PATH
WORKDIR /tmp

