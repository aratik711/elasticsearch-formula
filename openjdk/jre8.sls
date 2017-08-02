{%- from "openjdk/map.jinja" import openjdk with context %}

{% set settings = salt['grains.filter_by']({
  'Debian': {
    'package': 'openjdk-8-jre',
  },
  'RedHat': {
    'package': 'java-1.8.0-openjdk',
  },
}) %}


install_openjdk:
  pkg:
    - installed
    - name: {{ settings.package }}

