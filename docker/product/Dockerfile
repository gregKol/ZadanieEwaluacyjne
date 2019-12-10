FROM alpine/git as clone
RUN addgroup  -S gdocker && adduser -S udocker -G gdocker
USER udocker
WORKDIR /home/udocker
#WORKDIR /docker/sources
RUN git clone https://github.com/gregKol/product-repo.git


FROM maven:3.5-jdk-8-alpine  as mv
WORKDIR /home/udocker
COPY --from=clone /home/udocker/product-repo /home/udocker
RUN mvn install


FROM openjdk:8-jre-alpine
RUN addgroup  -S gdocker && adduser -S udocker -G gdocker
USER udocker

WORKDIR /docker/sources
COPY --from=mv /root/.m2/repository/pl/product/0.0.1-SNAPSHOT/product-0.0.1-SNAPSHOT.jar /docker/sources
CMD ["java", "-jar", "product-0.0.1-SNAPSHOT.jar"]