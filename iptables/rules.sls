include:
  - iptables.install

iptables_elasticsearch_rest_api:
  iptables.insert:
    - position: 5
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match:
      - state
      - tcp
      - comment
    - comment: "Allow ElasticSearch REST API port"
    - connstate: NEW
    - dport: 9200
    - proto: tcp
    - save: True
    - require:
      - sls: iptables.install

iptables_elasticsearch_node_comm:
  iptables.insert:
    - position: 6
    - table: filter
    - chain: INPUT
    - jump: ACCEPT
    - match:
      - state
      - tcp
      - comment
    - comment: "Allow ElasticSearch Node communication port"
    - connstate: NEW
    - dport: 9300
    - proto: tcp
    - save: True
    - require:
      - sls: iptables.install


