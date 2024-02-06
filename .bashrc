# .bashrc
#
# Configuration for non-login bash.

for f in /etc/bashrc "${HOME}/.rc" "${HOME}/.env"; do
  . $f
done
