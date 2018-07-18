#!/usr/bin/env bash

function loadConfig() {
    if [[ "$2" != "NULL" ]]
        then
            printf "\t$1: \"$2\",\n" >> "${DRILL_CONF_DIR}/drill-override.conf"
    fi
}

function loadMemoryConfig() {
    if [[ "$2" != "NULL" ]]
        then
            printf "export $1=$2" >> "${DRILL_CONF_DIR}/drill-env.sh"
    fi
}

if [[ "${DRILL_MODE}" == "distributed" ]]
    then
        printf "drill.exec: {\n" > "${DRILL_CONF_DIR}/drill-override.conf"
        loadConfig "cluster-id" "${DRILL_CLUSTER_ID}"
        loadConfig "zk.connect" "${DRILL_ZOOKEEPER_CONNECT}"
        printf "}\n" >> "${DRILL_CONF_DIR}/drill-override.conf"

        loadMemoryConfig "DRILLBIT_MAX_PROC_MEM" "${DRILL_DRILLBIT_MAX_PROC_MEM}"
        loadMemoryConfig "DRILL_HEAP" "${DRILL_DRILL_HEAP}"
        loadMemoryConfig "DRILL_MAX_DIRECT_MEMORY" "${DRILL_DRILL_MAX_DIRECT_MEMORY}"
        loadMemoryConfig "DRILLBIT_CODE_CACHE_SIZE" "${DRILL_DRILLBIT_CODE_CACHE_SIZE}"
        loadMemoryConfig "DRILL_HOST_NAME" "${DRILL_DRILL_HOST_NAME}"
        loadMemoryConfig "DRILL_LOG_NAME" "${DRILL_DRILL_LOG_NAME}"
        loadMemoryConfig "DRILL_LOG_DIR" "${DRILL_DRILL_LOG_DIR}"
        loadMemoryConfig "DRILL_JAVA_OPTS" "${DRILL_DRILL_JAVA_OPTS}"
        loadMemoryConfig "DRILLBIT_JAVA_OPTS" "${DRILL_DRILLBIT_JAVA_OPTS}"
        loadMemoryConfig "SQLLLINE_JAVA_OPTS" "${DRILL_SQLLINE_JAVA_OPTS}"
        loadMemoryConfig "DRILL_SHELL_JAVA_OPTS" "${DRILL_DRILL_SHELL_JAVA_OPTS}"
        loadMemoryConfig "DRILL_TMP_DIR" "${DRILL_DRILL_TMP_DIR}"

        # Start drillbit daemon on each node
        drillbit.sh start
fi

tail -f /dev/null