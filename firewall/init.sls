include:
  {% if salt['pillar.get']('elasticsearch:firewall') == "iptables" %}
  - firewall.iptables.init
  {% elif salt['pillar.get']('elasticsearch:firewall') == "firewalld" %}
  - firewall.firewalld.init
  {% else %}
  - firewall.error
  {% endif %}

