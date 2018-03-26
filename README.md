## ansible-playbook 初始化服务器和部署基础应用

- Ansible 2.3+ 版本

执行下面的命令运行这个playbook

	ansible-playbook -i hosts site.yml

### site.yml role 配置


``` 
# role initialize

 - hosts: localhost
   remote_user: root
   become: yes
   become_method: sudo
   gather_facts: yes
   roles:
    - { role: initialize }
    - { role: nginx }
    - { role: redis }
    - { role: memcached }
    - { role: nfs-client }
    - { role: nfs-server }
```

``` 
# role keepalived 

  - hosts: keepalived-master
    remote_user: root
    become: yes
    become_method: sudo
    gather_facts: no
    roles:
      - { role: keepalived, vip: 192.168.100.200, keepalived_node: master  }
      - { role: keepalived, vip: 192.168.100.200, keepalived_node: slave  }


```


### 改进

	平台兼容性

### 参考资料:
- http://www.jianshu.com/p/4906516a8d47
- https://www.centos.bz/2017/09/nfs%E8%BD%AF%E4%BB%B6%E6%9C%8D%E5%8A%A1%E5%88%A9%E7%94%A8ansible%E5%AE%9E%E7%8E%B0%E4%B8%80%E9%94%AE%E5%8C%96%E9%83%A8%E7%BD%B2/
- http://blog.csdn.net/qianggezhishen/article/details/53939188
- http://breezey.blog.51cto.com/2400275/1555530/
- http://docs.ansible.com/ansible/latest/list_of_all_modules.html