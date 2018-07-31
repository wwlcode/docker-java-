# docker制作java镜像
## 1.Dockfile说明
>>Dockerfile使用的基础镜像为公司提供的基础镜像。<br>
>>java环境的安装方法是在Dockfile路径下中添加事先准备好的jdk、Tomcat安装包、自己编写的启动脚本、以及进入容器运行的示例程序:<br>
>>>jdk-linux-x64.tar.gz(jdk安装包,超过100M,使用git lfs上传)<br>
>>>apache-tomcat-9.0.10.tar.gz(Tomcat安装包)<br>
>>>HelloWorld.java(示例程序)<br>
>>>run.sh(启动脚本,调用Tomcat的catalina.sh)<br>
>>使用ADD命令在构建镜像时候添加并且在指定路径解压两个安装包,添加示例程序和启动脚本<br>
>>根据解压的生成的目录使用ENV配置JAVA_HOME等环境变量<br>
>>使用RUN命令使用chomd改变用户对脚本文件的读写权限<br>
>>使用CMD在构建镜像时调用run.sh(脚本文件存放在根目录下,不用特别配置WORKDIR)<br>
>>使用EXPOSE启用端口80和443<br>
## 2.java镜像生成并测试
>>首先使用docker run --tag 命令创建标签.
