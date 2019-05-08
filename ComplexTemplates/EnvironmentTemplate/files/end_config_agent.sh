#!/bin/bash
echo "export HEAT_CONFIG_HOOKS=/var/lib/heat-config/hooks" >> /etc/rc.local
echo "export HEAT_SHELL_CONFIG=/usr/libexec/os-apply-config/templates/var/run/heat-config/heat-config" >> /etc/rc.local
echo "export HEAT_CONFIG_HOOKS=/var/lib/heat-config/hooks" >> /etc/profile
echo "export HEAT_SHELL_CONFIG=/usr/libexec/os-apply-config/templates/var/run/heat-config/heat-config" >> /etc/profile

# ln -s /usr/libexec/os-apply-config/templates/var/run/heat-config /var/run/heat-config
echo "export LC_ALL=en_US.UTF-8" >> /etc/profile

echo "Install & Configuration is finished" > /tmp/end_install_config_agent.out
