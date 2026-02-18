ansible
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-ansible
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/ansible:$V}
    OPTS=(
    --volume /pub/pkb/pb:/pub/pkb/pb:ro
    --volume /var/backup/pkb/pb:/var/backup/pkb/pb:rw
    --env ANSIBLE_CONFIG=/pub/pkb/pb/etc/ansible.cfg
    )
