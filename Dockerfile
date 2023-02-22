FROM ibm-semeru-runtimes:open-17-jre-focal
ARG USER=user
RUN addgroup --system ${USER} && adduser --system --ingroup ${USER} ${USER}
USER ${USER}:${USER}
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
