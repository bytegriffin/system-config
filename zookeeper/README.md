单台server安装redis cluster

1.下载并安装zookeeper
```xml
wget https://archive.apache.org/dist/zookeeper/zookeeper-3.5.5/apache-zookeeper-3.5.5.tar.gz
sudo tar xzf apache-zookeeper*.tar.gz -C /opt/ide && rm -rf apache-zookeeper*.tar.gz
```

2.配置zookeeper
```xml
cd /opt/ide/apache-zookeeper*
cp conf/zoo_sample.cfg conf/zoo1.cfg
cp conf/zoo_sample.cfg conf/zoo2.cfg
cp conf/zoo_sample.cfg conf/zoo3.cfg
echo "1" > /opt/ide/apache-zookeeper-3.5.5/data/zk1/myid
echo "2" > /opt/ide/apache-zookeeper-3.5.5/data/zk2/myid
echo "3" > /opt/ide/apache-zookeeper-3.5.5/data/zk3/myid
```

3.启动zookeeper
```xml
bin/zkServer.sh start conf/zoo1.cfg
bin/zkServer.sh start conf/zoo2.cfg
bin/zkServer.sh start conf/zoo3.cfg
```

4.查询zookeeper
```xml
bin/zkServer.sh status conf/zoo1.cfg
bin/zkServer.sh status conf/zoo2.cfg
bin/zkServer.sh status conf/zoo3.cfg
bin/zkCli.sh -server localhost:2181,localhost:2182,localhost:2183
ls /
get /
```

