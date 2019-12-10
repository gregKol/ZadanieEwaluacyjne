FROM alpine/git as clone
RUN addgroup  -S gdocker && adduser -S udocker -G gdocker
USER udocker
WORKDIR /home/udocker
#WORKDIR /docker/sources
RUN git clone https://github.com/gregKol/credit-repo.git

FROM maven:3.5-jdk-8-alpine  as mv
WORKDIR /home/udocker
COPY --from=clone /home/udocker/credit-repo /home/udocker
RUN mvn install


FROM openjdk:8-jre-alpine
WORKDIR /docker/sources
COPY --from=mv /root/.m2/repository/pl/credit/0.0.1-SNAPSHOT/credit-0.0.1-SNAPSHOT.jar /docker/sources
CMD ["java", "-jar", "credit-0.0.1-SNAPSHOT.jar"]