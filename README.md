# Minecraft CatServer Docker

这是一个用 Docker 运行 Minecraft CatServer 服务器的项目。CatServer 是一个高性能的 Minecraft 服务端，支持同时加载 Bukkit 插件和 Forge 模组。

## 系统要求

- Docker 20.10.0 或更高版本
- Docker Compose 2.0.0 或更高版本
- 至少 4GB 内存
- 至少 10GB 可用磁盘空间

## 快速开始

1. 克隆此仓库：
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. 启动服务器：
   ```bash
   docker-compose up -d
   ```

3. 查看服务器日志：
   ```bash
   docker-compose logs -f
   ```

4. 停止服务器：
   ```bash
   docker-compose down
   ```

## 服务器配置

### 基本配置
- 默认服务器端口：25565
- 服务器文件存储位置：项目根目录
- 默认 JAR 文件：CatServer-1.16.5-1d8d6313-server.jar

### 高级配置
可以通过修改 `docker-compose.yml` 来自定义以下配置：

- JAR_FILE：服务器核心文件名
- 端口映射：修改 "25565:25565" 为所需端口
- 内存限制：可添加 JVM 参数来限制内存使用

示例配置：
```yaml
environment:
  - JAR_FILE=CatServer-1.16.5-1d8d6313-server.jar
  - JAVA_OPTS=-Xmx4G -Xms2G
```

## 文件结构
```
.
├── Dockerfile          # Docker 构建文件
├── docker-compose.yml  # Docker Compose 配置文件
├── server.properties   # Minecraft 服务器配置（首次启动后生成）
├── plugins/           # 插件目录
└── mods/              # 模组目录
```

## 注意事项

- 首次启动时，服务器会自动生成所需的配置文件
- 所有服务器文件（包括世界数据、配置等）都会保存在项目根目录
- 修改服务器配置后需要重启容器才能生效
- 建议定期备份世界数据和配置文件

## 故障排除

1. 如果服务器无法启动，请检查：
   - Docker 服务是否正在运行
   - 端口 25565 是否被占用
   - 系统内存是否充足

2. 如果遇到性能问题：
   - 调整 JVM 参数优化内存使用
   - 检查已安装的插件和模组数量
   - 确保系统资源充足

3. 如果需要更新 CatServer：
   - 停止服务器
   - 替换 JAR 文件
   - 更新 docker-compose.yml 中的 JAR_FILE 环境变量
   - 重新启动服务器

## 备份建议

建议定期备份以下内容：
- world/ 目录（世界数据）
- plugins/ 目录（插件及其配置）
- mods/ 目录（模组文件）
- server.properties（服务器配置）
