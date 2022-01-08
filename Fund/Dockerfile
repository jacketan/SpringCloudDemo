FROM centos:7

ARG JAR_FILE="./target/*.jar"
ARG SERVER_PORT=9003
ARG PROFILES="prod"
ARG LOG_FILE="/app/app.log"
ARG WORK_PATH="/app"
ARG JVM_OPTS="-Xmx6144m -Xms2048m -XX:ReservedCodeCacheSize=240m -XX:+UseG1GC"
#服务端口
ENV SERVER_PORT $SERVER_PORT
#启动环境配置
ENV PROFILES $PROFILES
#日志路径
ENV LOG_FILE $LOG_FILE
#工作路径
ENV WORK_PATH $WORK_PATH
# 内存配置
ENV JVM_OPTS $JVM_OPTS

# 安装openjdk8
RUN echo "ip_resolve=4" >> /etc/yum.conf
RUN yum update -y && yum install -y java-1.8.0-openjdk

# 默认安装vim工具
RUN yum install -y vim

# 设置时区。这对于日志、调用链等功能能否在 TSF 控制台被检索到非常重要。
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

# 设置中文环境
RUN yum install -y kde-l10n-Chinese && yum reinstall -y glibc-common && localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
RUN echo 'LANG="zh_CN.UTF-8"' >> /etc/locale.conf
ENV LC_ALL zh_CN.UTF-8

WORKDIR ${WORK_PATH}

EXPOSE ${SERVER_PORT}

#把jar包添加到镜像
COPY ${JAR_FILE} ${WORK_PATH}/app.jar

# 把日志输出关联到logs
RUN touch ${LOG_FILE} && ln -sf /dev/stdout ${LOG_FILE}

ENTRYPOINT [ "sh", "-ec", "exec java ${JVM_OPTS} -Dserver.port=${SERVER_PORT} -Dspring.main.allow-bean-definition-overriding=true -Dspring.profiles.active=${PROFILES} ${JAVA_OPTS} -jar ${WORK_PATH}/app.jar > ${LOG_FILE} " ]
