FROM openjdk:11

COPY ./target/test-cicd.jar /app/

WORKDIR /app
EXPOSE 8090
CMD java -jar test-cicd.jar
