include:
  - firewall.firewalld.install

## Enable and start firewalld service
firewalld:
  service.running:
    - enable: True
    - reload: True
    - require:
      - pkg: firewalld_install

