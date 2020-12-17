# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-7.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export M2_HOME=/usr/local/Cellar/maven@3.0/3.0.5/libexec
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx3000m -XX:PermSize=1024m -XX:MaxPermSize=1024m"

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH=$PATH:$HOME/.dotfiles/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$M2_HOME/bin
export PATH=$PATH:$HOME/.libs/flutter/bin
export PATH=$PATH:$HOME/.local/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
#export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

export LANG=en_US

export BAT_THEME=ansi-light
export VAULT_ADDR=https://vault.swile-internal-services.co/
export PGUSER=postgres
