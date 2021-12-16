#!/bin/sh

[[ -n "${NGINXLDAP_HOSTNAME}" ]] && flags="--host ${NGINXLDAP_HOSTNAME}"
[[ -n "${NGINXLDAP_PORT_NUMBER}" ]] && flags="${flags} -p ${NGINXLDAP_PORT_NUMBER}"
[[ -n "${NGINXLDAP_LDAP_URI}" ]] && flags="${flags} -u ${NGINXLDAP_LDAP_URI}"
[[ -n "${NGINXLDAP_LDAP_BASE_DN}" ]] && flags="${flags} -b ${NGINXLDAP_LDAP_BASE_DN}"
[[ -n "${NGINXLDAP_LDAP_BIND_DN}" ]] && flags="${flags} -D ${NGINXLDAP_LDAP_BIND_DN}"
[[ -n "${NGINXLDAP_LDAP_BIND_PASSWORD}" ]] && flags="${flags} -w ${NGINXLDAP_LDAP_BIND_PASSWORD}"
[[ -n "${NGINXLDAP_LDAP_FILTER}" ]] && flags="${flags} -f ${NGINXLDAP_LDAP_FILTER}"
[[ -n "${NGINXLDAP_HTTP_REALM}" ]] && flags="${flags} -R ${NGINXLDAP_HTTP_REALM}"
[[ -n "${NGINXLDAP_HTTP_COOKIE_NAME}" ]] && flags="${flags} -c ${NGINXLDAP_HTTP_COOKIE_NAME}"

echo "** Starting NGINX LDAP Auth Daemon **"

python /usr/src/app/nginx-ldap-auth-daemon.py "${flags}"
