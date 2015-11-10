FROM ubuntu

RUN apt-get update && apt-get install -y arduino

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/j && \
    echo "j:x:${uid}:${gid}:j,,,:/home/j:/bin/bash" >> /etc/passwd && \
    echo "j:x:${uid}:" >> /etc/group && \
    echo "j ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/j && \
    chmod 0440 /etc/sudoers.d/j && \
    chown ${uid}:${gid} -R /home/j

RUN adduser j dialout

RUN mkdir /home/j/cloud

USER j
ENV HOME /home/j
CMD /usr/bin/arduino
