FROM openjdk:8-jre-slim

# 创建工作目录
WORKDIR /app

# 定义具体的 JAR 文件名
ENV JAR_FILE=CatServer-1.16.5-1d8d6313-server.jar

# 复制指定的 JAR 文件到容器中
COPY ./${JAR_FILE} /app/server.jar

# 设置权限
RUN chmod +x /app/server.jar

# 设置容器启动命令
ENTRYPOINT ["java", "-jar", "server.jar"]