FROM openjdk:11

COPY ./target/test-cicd-1.0-SNAPSHOT.jar /app/

WORKDIR /app
EXPOSE 8090
CMD java -jar test-cicd-1.0-SNAPSHOT.jar
