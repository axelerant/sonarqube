#!/bin/bash
set -e
export SONARQUBE_JDBC_URL=jdbc:mysql://$MYSQL_HOST:$MYSQL_PORT/sonar?useUnicode=true\&amp\;characterEncoding\=utf8
export SONARQUBE_JDBC_PASSWORD=$MYSQL_PASSWORD
if [ "${1:0:1}" != '-' ]; then
        exec "$@"
	fi

	exec java -jar lib/sonar-application-$SONAR_VERSION.jar \
	  -Dsonar.log.console=true \
	    -Dsonar.jdbc.username="$SONARQUBE_JDBC_USERNAME" \
	      -Dsonar.jdbc.password="$SONARQUBE_JDBC_PASSWORD" \
	        -Dsonar.jdbc.url="$SONARQUBE_JDBC_URL" \
		  -Dsonar.web.host="0.0.0.0" \
		    -Dsonar.web.port="8888" \
		      -Dsonar.web.javaAdditionalOpts="-Djava.security.egd=file:/dev/./urandom" \
		              "$@"

