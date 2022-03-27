#！ /bin/bash
# 定义变量
image=spring-boot-admin-server
username=choelea #dockerhub用户名
namespace=$username #必须用dockerhub的用户名
password=$1 #dockerhub 密码
tag=$2

mvn clean package -Dmaven.test.skip=true
docker login --username=$username --password=$password  # 使用注册的docker id登录；密码就是登陆否则登录hub.docker.com网站的密码
docker build -t $namespace/$image:$tag .
docker tag $namespace/$image:$tag $namespace/$image:$tag
docker push $namespace/$image:$tag

## 全路径将会是： docker.io/choelea/spring-boot-admin-server