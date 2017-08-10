Elasticsearch
=============

Formula to install and configure Elasticsearch. Supports 5.x on RedHat based OS.


Available states
================

``elasticsearch``
-----------

Installs, configures and runs the Elasticsearch service.

``elasticsearch.config``
------------------------

Configures Elasticsearch.

``elasticsearch.install``
---------------------

Installs Elasticsearch.

``elasticsearch.jvmopts``
-------------------------

Configures JVM parameters.

``elasticsearch.repo``
----------------------

Adds the Elasticsearch pkg repo.


``elasticsearch.service``
-------------------------

Manages the Elasticsearch service.

``elasticsearch.sysconfig``
---------------------------

Configures defaults/sysconfig env vars for the Elasticsearch service.

``elasticsearch.plugins``
-------------------------

Allows configuration of elasticsearch plugins.

``firewall``
-------------

Configure firewall(iptables/firewalld).

``firewall.error``
-------------------

Raise an error if no firewall package mentioned in pillars file.

``firewall.firewalld``
---------------------

Configures firewalld.

``firewall.firewalld.install``
------------------------

Installs firewalld package.

``firewall.firewalld.rules``
-------------------------

Open ports 9200/9300.

``firewall.firewalld.service``
-----------------------------

Start and enable firewalld service.

``firewall.iptables``
---------------------

Configures iptables.

``firewall.iptables.install``
------------------------

Installs iptables package.

``firewall.iptables.rules``
-------------------------

Open ports 9200/9300.

``firewall.iptables.service``
-----------------------------

Start and enable iptables service.

``openjdk``
-----------

Configure OpenJDK

``openjdk.jdk8``
----------------

Install openjdk java 1.8.

``openjdk.jre8``
----------------

Install openjdk jre 1.8.

How to use
================
* Clone the project: `git clone http://<username>@10.43.13.163/arati.kulkarni/elasticsearch-formula.git`<br />
* Add the project path in the master configuration file `/etc/salt/master` in file_roots path:<br />
Example:

```
file_roots:
   base:
     - /srv/formulas/elasticsearch-formula
```

* Add the pillars root in the master configuration as well: <br />
Example:

```
 pillar_roots:
   base:
     - /srv/formulas/elasticsearch-formula/pillars
```

* Restart salt master: `service salt-master restart`

* Add the following roles(es_master/es_datanode) in minion configuaration `/etc/salt/minion`.
 
```
grains:
  roles:
    - es_master
    - es_datanode
```


The es_master role to be added to the machines that will act as master in cluster.<br />
The es_datanode role to be added to the machines that will act as datanode in cluster.

* Restart salt minion.

* Edit the configurations in `elasticsearch-formula/pillars/elasticsearch.yml` such as:
  * version: [major, minor]
  * config: Cluster settings
  * firewall: firewall package to be used (iptables/firewalld)
  * plugins: elasticsearch plugins to be enabled
  * jvm_opts: jvm heap size

* Execute the salt formula as:
`salt '*' state.apply`

* Check the cluster status on any node by executing:
`curl localhost:9200/_cluster/health`




