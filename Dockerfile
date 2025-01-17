FROM pedrocesarti/jmeter-docker:5.0

RUN mkdir /jmeter/apache-jmeter-5.0/test
RUN mkdir /jmeter/apache-jmeter-5.0/logs
RUN mkdir /jmeter/output

RUN chmod 777 -R ./*

WORKDIR /jmeter/apache-jmeter-5.0

COPY ./lib/json.jar /jmeter/apache-jmeter-5.0/lib/json.jar
#COPY ./test/target.jmx /jmeter/apache-jmeter-5.0/test/target.jmx
#COPY ./test/keywords.txt /jmeter/apache-jmeter-5.0/test/keywords.txt

COPY ./script/docker-entrypoint.sh /jmeter/apache-jmeter-5.0/test/docker-entrypoint.sh

VOLUME /jmeter/output

RUN chmod 777 -R ./*

#EXPOSE 6000 1099 50000

ENTRYPOINT ["/jmeter/apache-jmeter-5.0/test/docker-entrypoint.sh"]