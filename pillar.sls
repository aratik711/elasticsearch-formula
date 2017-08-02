elasticsearch:
  version: 5.5
  config:
    cluster.name: my-application
    node.name: vrushabh
    node.rack: r2
    path.data: /opt/apps/elasticsearch
    path.logs: /var/log/elasticsearch
    bootstrap.mlockall: true
    network.host: 0.0.0.0
    http.port: 9200
    discovery.zen.ping.unicast.hosts: ["192.168.1.15", "192.168.1.25"]
    discovery.zen.minimum_master_nodes: 2
    gateway.recover_after_nodes: 2
    node.max_local_storage_nodes: 1
    action.destructive_requires_name: true
  sysconfig:
    ES_STARTUP_SLEEP_TIME: 5
    ES_HEAP_SIZE: 2g
    MAX_OPEN_FILES: 65535
  plugins:
    lang-python: lang-python
