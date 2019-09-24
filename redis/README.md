单台server安装redis cluster

1.下载并安装redis
wget http://download.redis.io/releases/redis-5.0.5.tar.gz
sudo mv redis*.tar.gz /opt/ide/ && tar xzf /opt/ide/redis*.tar.gz -C /opt/ide && rm -rf /opt/ide/redis*.tar.gz
cd /opt/ide/redis-*
make

2.redis cluster至少需要6个节点，在redis目录下创建一个cluster目录，存放多个配置文件
mkdir cluster
cp redis.conf cluster/redis-6374.conf
cp redis.conf cluster/redis-6375.conf
cp redis.conf cluster/redis-6376.conf
cp redis.conf cluster/redis-6377.conf
cp redis.conf cluster/redis-6378.conf
cp redis.conf cluster/redis-6379.conf

3.启动各个redis和redis cluster
src/redis-server cluster/redis-6374.conf
src/redis-server cluster/redis-6375.conf
src/redis-server cluster/redis-6376.conf
src/redis-server cluster/redis-6377.conf
src/redis-server cluster/redis-6378.conf
src/redis-server cluster/redis-6379.conf
src/redis-cli --cluster create 192.168.1.102:6374 192.168.1.102:6375 192.168.1.102:6376 192.168.1.102:6377 192.168.1.102:6378 192.168.1.102:6379 --cluster-replicas 1

4.查询redis中的数据
src/redis-cli -h 192.168.1.102 -p 6374
keys *







