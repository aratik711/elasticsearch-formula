elasticsearch:
  #Define the major and minor version for ElasticSearch
  version: [5, 5] 
  # ElasticSearch Cluster configurations
  config:
    cluster.name: my-application
    node.attr.rack: r2
    path.data: /opt/apps/elasticsearch
    path.logs: /var/log/elasticsearch
    bootstrap.memory_lock: '"true"'
    network.host: 0.0.0.0
    http.port: 9200
    discovery.zen.minimum_master_nodes: 1
    gateway.recover_after_nodes: 1
    node.attr.max_local_storage_nodes: 1
    action.destructive_requires_name: '"true"'
  # ElasticSearch system configurations
  sysconfig:
    ES_STARTUP_SLEEP_TIME: 5
    MAX_OPEN_FILES: 65535
  # JVM heap settings
  jvm_opts:
    heap_size: 2g
  # elasticSearch plugins to enable
  plugins:
    lang-python: lang-python
  # Firewall package to be used(iptables/firewalld)
  firewall: iptables
  # Adding mine ip address function
  mine_functions:
    network.ip_addrs:
      - eth0

