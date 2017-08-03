elasticsearch:
  version: [5, 5] 
  config:
    cluster.name: my-application
    node.attr.name: testhost
    node.attr.rack: r2
    path.data: /opt/apps/elasticsearch
    path.logs: /var/log/elasticsearch
    bootstrap.memory_lock: true
    network.host: 0.0.0.0
    http.port: 9200
    discovery.zen.ping.unicast.hosts: ["ip1", "ip2"]
    discovery.zen.minimum_master_nodes: 2
    gateway.recover_after_nodes: 2
    node.attr.max_local_storage_nodes: 1
    action.destructive_requires_name: true
    node.master: true
    node.data: true
  sysconfig:
    ES_STARTUP_SLEEP_TIME: 5
    MAX_OPEN_FILES: 65535
  jvm_opts:
    heap_size: 2g
  plugins:
    lang-python: lang-python
