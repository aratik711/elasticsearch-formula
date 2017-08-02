iptables_elasticsearch_rest_api:
  iptables.append:
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


iptables_elasticsearch_node_comm:
  iptables.append:
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

