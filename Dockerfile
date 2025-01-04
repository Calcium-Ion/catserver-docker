FROM openjdk:8-jre-slim

# 创建工作目录
WORKDIR /app

# 定义 JAR 文件名的环境变量，可在构建或运行时覆盖
ENV JAR_FILE=app.jar

# 复制 JAR 文件到容器中
COPY *.jar ${JAR_FILE}

# 设置容器启动命令
ENTRYPOINT ["sh", "-c", "java -jar ${JAR_FILE}"]