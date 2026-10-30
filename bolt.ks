# UDOO Bolt: install the AlmaLinux 10 bootc image. Wipes the first internal disk.
text
reboot
lang en_US.UTF-8
keyboard us
timezone UTC --utc
network --bootproto=dhcp --device=link --activate --hostname=bao-bolt
rootpw --lock
user --name=admin --groups=wheel --lock
sshkey --username=admin "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILkE9dHhnp7vUjmf5+qpi2B8JZgx/rflJi7ics7zg1HF ernest.lee@desktop-cme56a7"
zerombr
clearpart --all --initlabel
autopart --type=plain --fstype=xfs --nohome
ostreecontainer --url=ghcr.io/v-sekai-fire/service-bao-bolt-os:latest --transport=registry --no-signature-verification

%post --log=/root/ks-post.log
echo 'admin ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/admin && chmod 440 /etc/sudoers.d/admin
%end
