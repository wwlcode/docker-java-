# docker制作java镜像
## 1.旧版Dockfile说明(使用ADD方式添加jdk安装包版本preDockerfile)
>>Dockerfile使用的基础镜像为公司提供的基础镜像。<br>
>>java环境的安装方法是在Dockfile路径下中添加事先准备好的jdk、Tomcat安装包、自己编写的启动脚本、以及进入容器运行的示例程序:<br>
>>>jdk-linux-x64.tar.gz(jdk安装包,超过100M,使用git lfs上传,不是测试所用的jdk版本)<br>
>>>.gitattributes(git lfs 相关文件)<br>
>>>apache-tomcat-9.0.10.tar.gz(Tomcat安装包)<br>
>>>HelloWorld.java(示例程序)<br>
>>>run.sh(启动脚本,调用Tomcat的catalina.sh)<br>
>>使用ADD命令在构建镜像时候添加并且在指定路径解压两个安装包,添加示例程序和启动脚本<br>
>>根据解压的生成的目录使用ENV配置JAVA_HOME等环境变量<br>
>>使用RUN命令使用chomd改变用户对脚本文件的读写权限<br>
>>使用CMD在构建镜像时调用run.sh(脚本文件存放在根目录下,不用特别配置WORKDIR)<br>
>>使用EXPOSE启用端口80和443<br>
## 2.最新Dockfile说明(使用wget方式添加jdk安装包版本Dockerfile)
>>Dockerfile使用的基础镜像为公司提供的基础镜像。<br>
>>java环境的安装方法是在Dockfile路径下中添加事先准备好的Tomcat安装包、自己编写的启动脚本、以及进入容器运行的示例程序:<br>
>>>不需要jdk安装包,使用wget的方式从甲骨文官网下载<br>
>>>apache-tomcat-9.0.10.tar.gz(Tomcat安装包)<br>
>>>HelloWorld.java(示例程序)<br>
>>>run.sh(启动脚本,调用Tomcat的catalina.sh)<br>
>>使用ADD命令在构建镜像时候添加并且在指定路径解压Tomcat安装包,添加示例程序和启动脚本<br>
>>根据解压的生成的目录使用ENV配置JAVA_HOME等环境变量<br>
>>使用RUN命令使用chomd改变用户对脚本文件的读写权限<br>
>>使用CMD在构建镜像时调用run.sh(脚本文件存放在根目录下,不用特别配置WORKDIR)<br>
>>使用EXPOSE启用端口80和443<br>
## 3.java镜像生成并测试

>>1.首先使用docker build --tag 命令创建标签.<br>
![Ubuntu执行图](https://github.com/wwlcode/photo/blob/master/1.png)<br>
>>2.使用docker run --name javatest -d -p 80:80 -v /root/data:/data java:9.9 将镜像运行为一个名为javatest且80端口与主机80端口相连,/data目录与主机/root/data目录共享的容器,并用docker ps 查看正在运行的容器情况<br>
![Ubuntu执行图](https://github.com/wwlcode/photo/blob/master/2.png)<br>
>>3.使用docker exec命令连接容器<br>
![Ubuntu执行图](https://github.com/wwlcode/photo/blob/master/3.png)<br>
>>4.输入java -version查看java版本<br>
![Ubuntu执行图](https://github.com/wwlcode/photo/blob/master/4.png)<br>
>>5.编译java示例程序<br>
![Ubuntu执行图](https://github.com/wwlcode/photo/blob/master/5.png)<br>
