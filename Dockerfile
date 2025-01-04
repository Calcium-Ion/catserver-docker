FROM openjdk:8-jre-slim

# 创建工作目录
WORKDIR /app

# 定义环境变量
ENV JAR_FILE=CatServer-1.16.5-1d8d6313-server.jar
ENV JAVA_OPTS="-Xmx2G -Xms1G"

# 设置容器启动命令
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar ${JAR_FILE}"]