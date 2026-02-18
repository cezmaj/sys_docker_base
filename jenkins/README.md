jenkins
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-jenkins-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/jenkins:$V}
    OPTS=(
    --publish $(ipa brsvc1):8083:8080
    --volume /var/opt/jenkins/$A:/var/opt/jenkins
    --env JENKINS_URLS=/dc1/jenkins/s
    )
    INIT=(
     "install -m 0775 -o 666 -g 666 -d /var/opt/jenkins/$A"
    )
