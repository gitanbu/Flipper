  FROM centos:7
  LABEL MAINTAINER  atom@accenture.com
 
  RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
  RUN yum update -y
  RUN yum install yum-utils
  RUN yum groupinstall -y development
  RUN yum install -y python36u
  RUN yum install -y python36u-libs
  RUN yum install -y python36u-devel
  RUN yum install -y python36u-pip
  RUN yum install -y httpd
  COPY cgi-bin /var/www/cgi-bin/
  COPY html  /var/www/html/
  COPY 000-default.conf /etc/apache2/sites-enabled/
  COPY apache2.conf /etc/apache2/
  RUN a2enmod cgi
  CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
 
  EXPOSE 80

