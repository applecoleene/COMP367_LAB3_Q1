FROM openjdk:11
RUN apt-get install -y openjdk-11-jdk
ADD target/AppleDuquinal_COMP367_Q3-0.0.1-SNAPSHOT.jar AppleDuquinal_COMP367_Q3-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar","AppleDuquinal_COMP367_Q3-0.0.1-SNAPSHOT.jar"]