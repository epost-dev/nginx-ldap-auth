FROM python:alpine3.14

COPY nginx-ldap-auth-daemon.py /usr/src/app/
COPY run.sh /usr/src/app/

WORKDIR /usr/src/app/

# Install required software
RUN \
    apk --no-cache add openldap-dev && \
    apk --no-cache add --virtual build-dependencies build-base && \
    python -m pip install --upgrade pip && \
    pip install python-ldap && \
    apk del build-dependencies

EXPOSE 8888

CMD ["sh", "/usr/src/app/run.sh"]
