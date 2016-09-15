#!/bin/sh

#
# Ubuntu Equip 
# IntelliJ Idea IDE (latest version https://download.jetbrains.com/idea/ideaIC-2016.2.4.tar.gz)
# Licence: Apache 2.0
# to run: wget --no-check-certificate https://github.com/kolov/ubuntu-equip/raw/master/equip_idea_ide.sh && bash equip_idea_ide.sh
#                                    &&

if [ -d "/opt/idea" ]; then
	echo "Idea already installed in /opt/idea, skipping!"
	rm -f equip_idea_ide.sh
	exit 0
fi

VERSION="ideaIC-2016.2.4.tar.gz"
LINK="https://download.jetbrains.com/idea/$VERSION"

wget --no-check-certificate --timestamping "$LINK"
mv $VERSION idea.tar.gz
tar -xvf idea.tar.gz

# Will copy to /opt
sudo mv idea /opt/

# Cleanup
rm -f idea.tar.gz
rm -f equip_idea_ide.sh

#Create link on the PATH
sudo ln -s /opt/idea/bin/idea.sh /usr/local/bin/idea

echo "Installed in /opt/idea"
