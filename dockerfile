FROM openjdk:11

WORKDIR /app
EXPOSE 8090
COPY my-cool-app.jar ./app.jar
CMD java -jar app.jar