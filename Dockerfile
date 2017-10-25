FROM java:8
#install tomacat
RUN wget http://apache.website-solution.net/tomcat/tomcat-8/v8.5.23/bin/apache-tomcat-8.5.23.tar.gz && \
    tar xzf ./apache-tomcat-8.5.23.tar.gz -C / && \
    echo "finish tomcat install" && \
    env
ENV TOMCAT_HOME /apache-tomcat-8.5.23
ENV CATALINA_HOME /apache-tomcat-8.5.23
ENV PATH $PATH:$TOMCAT_HOME/bin

#RUN apt-get update && apt-get install net-tools
# install newrelic-apm-gaent for java
RUN wget https://oss.sonatype.org/content/repositories/releases/com/newrelic/agent/java/newrelic-java/3.34.0/newrelic-java-3.34.0.zip && \
    unzip ./newrelic-java-3.34.0.zip -d /apache-tomcat-8.5.23
#modify newrelic.yml    
#RUN cd /apache-tomcat-8.5.23/newrelic && \
 #   sed -i "s/log_level:\ info/log_level:\ finest/" newrelic.yml && \
  #sed -i "s/app_name:\ My\ Application/app_name:\ sample/" newrelic.yml && \
   # sed -i "s/<%= license_key %>/589ba8fc970b753b7f6e0f254755f6e65904c4a5/" newrelic.yml


RUN  java -jar /apache-tomcat-8.5.23/newrelic/newrelic.jar install -s /apache-tomcat-8.5.23/ && \
    echo "finish newrelic-java-apm-agent install"

RUN wget https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war && \
    mv ./sample.war /apache-tomcat-8.5.23/webapps
ENV CATALINA_OPTS -javaagent:/apache-tomcat-8.5.23/newrelic/newrelic.jar
ENV JAVA_OPTS $JAVA_OPTS -javaagent:/apache-tomcat-8.5.23/newrelic/newrelic.jar

#RUN export JAVA_OPTS="$JAVA_OPTS -javaagent:/apache-tomcat-8.5.23/newrelic/newrelic.jar" && \
#RUN  chmod +x /apache-tomcat-8.5.23/bin/startup.sh
#CMD sh /apache-tomcat-8.5.23/bin/startup.sh  &
RUN chmod +x /apache-tomcat-8.5.23/bin/*.sh
RUN chmod +x /apache-tomcat-8.5.23/newrelic/*.yml
RUN echo "sample env" && \
    env
EXPOSE 8080
COPY ./run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/bin/bash"]
CMD ["/run.sh"]
#    ps -ef|grep newrelic
 
#CMD java -javaagent:/newrelic/mewrelic.jar HelloWorld
