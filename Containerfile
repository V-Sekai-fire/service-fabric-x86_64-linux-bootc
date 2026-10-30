FROM quay.io/almalinuxorg/almalinux-bootc:10
RUN dnf -y install podman chrony rsync tar openssl && dnf clean all
# XFS root on install (btrfs is blocklisted)
COPY 00-xfs.toml /usr/lib/bootc/install/00-xfs.toml
# self-updating: fetch the newest image and apply it on a timer
RUN systemctl enable sshd chronyd bootc-fetch-apply-updates.timer
