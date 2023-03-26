FROM openjdk:8
ADD target/dockermavenlab3.jar dockermavenlab3.jar
ENTRYPOINT ["java", "-jar","dockermavenlab3.jar"]