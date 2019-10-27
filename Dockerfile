FROM openjdk:8-jre-alpine

ARG APP_DIR=/app/petclinic

COPY entrypoint.sh /

RUN mkdir -p ${APP_DIR} \
    && chmod +x /entrypoint.sh

WORKDIR ${APP_DIR}

COPY ./java-petclinic.jar ${APP_DIR}/

RUN chmod +x ${APP_DIR}/java-petclinic.jar

EXPOSE 8080

#HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost:8080/ || exit 1

ENTRYPOINT [ "/entrypoint.sh" ]