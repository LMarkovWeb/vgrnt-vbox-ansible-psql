# Сервер с БД PostgreSQL

## Документация

### Ansible playbook

Ansible ver. 2.9  
Для корректной работы используется
virtualenv.

Ansible устанавливает:

- проверка группы wheel и отключение ввода пароля
- отключает доступ root по ssh
- обновление системы
- устанавливает правила для iptables
- устанавливает PostgreSQL

#### iptables

Разрешенные сети:
192.168.10.0/24

Разрешенные порты:
22, 5432

## Установка

**Vagrantfile** c generic/**centos8**

```
user: vagrant
pass: vagrant
```

### Запуск

```bash
vagrant up
```

Установка Ansible в virtualenv и запуск playbook

```
./play-ansible.sh --vagrant
```

Проверка доступности тестового сервера

```bash
ansible test_server -m ping
```

```
user: ansible
pass: ansible
```
