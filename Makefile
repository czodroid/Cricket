# Filename: Makefile
# Author: Olivier Sirol <czo@free.fr>
# License: GPL-2.0 (http://www.gnu.org/copyleft)
# File Created: Jan 2012
# Last Modified: lundi 18 avril 2022, 19:23
# Edit Time: 2:53:18
# Description:
#
# $Id: $
#

all: release

release:
	./gradlew assembleRelease
	@echo "<- done!"

scp:
	scp app/build/outputs/apk/release/org.czo.cricket-`date +%Y%m%d`-release.apk  czo@ananas:/tank/data/czo/www/ananas.czo.wf/intranet/download/apk
	@echo "<- done!"

debug:
	./gradlew assembleDebug --warning-mode all
	@echo "<- done!"

clean:
	./gradlew clean
	rm -fr .gradle
	rm -fr build
	rm -fr app/build app/libs app/release app/debug
	rm -fr Cricket.iml app/app.iml
	rm -fr captures
	rm -fr .idea
	@echo "<- done!"

realclean: clean
	rm -f *.apk
	@echo "<- done!"

fclean: realclean

re: realclean all

